use snarkvm_console_network::Testnet3;
use snarkvm_utilities::rand::TestRng;
use rand::RngCore;
use snarkvm_synthesizer::{CoinbasePuzzle, EpochChallenge, PuzzleConfig};
use snarkvm_console_account::{Address, PrivateKey};
use snarkvm_curves::{PairingEngine, PairingCurve};
use snarkvm_algorithms::{
    fft::{DensePolynomial, EvaluationDomain}};
use snarkvm_console::network::Network;
use snarkvm_algorithms::polycommit::kzg10::*;
use snarkvm_curves::bls12_377::{Bls12_377, Fr};

use anyhow::Result;
use snarkvm_utilities::bytes::ToBytes;

use snarkvm_synthesizer::coinbase_puzzle::hash::hash_to_polynomial;
use std::time::SystemTime;
use std::thread;

///////////

use std::sync::Arc;
use snarkvm_synthesizer::coinbase_puzzle::helpers::CoinbaseProvingKey;

type CoinbasePuzzleInst = CoinbasePuzzle<Testnet3>;

fn prover_polynomial<N:Network>(
    epoch_challenge: &EpochChallenge<N>,
    address: Address<N>,
    nonce: u64,
) -> Result<DensePolynomial<<N::PairingCurve as PairingEngine>::Fr>> {
    let input = {
        let mut bytes = [0u8; 76];
        bytes[..4].copy_from_slice(&epoch_challenge.epoch_number().to_bytes_le()?);
        bytes[4..36].copy_from_slice(&epoch_challenge.epoch_block_hash().to_bytes_le()?);
        bytes[36..68].copy_from_slice(&address.to_bytes_le()?);
        bytes[68..].copy_from_slice(&nonce.to_le_bytes());
        bytes
    };
    Ok(hash_to_polynomial::<<N::PairingCurve as PairingEngine>::Fr>(&input, epoch_challenge.degree()))
}

fn main() {

    let mut rng = TestRng::default();
    let epoch_challenge = EpochChallenge::<Testnet3>::new(rng.next_u32(), Default::default(), 8191).unwrap();
    let private_key = PrivateKey::<Testnet3>::new(&mut rng).unwrap();
    let address = Address::<Testnet3>::try_from(&private_key).unwrap();
    let nonce = rng.next_u64();
    let minimum_proof_target: Option<u64> = Some(837375804);

    for _i in 1..10{
        let sys_time1 = SystemTime::now();

        let polynomial = prover_polynomial(&epoch_challenge, address, nonce).unwrap();
        
        let sys_time2 = SystemTime::now();
        let difference = sys_time2.duration_since(sys_time1);
        println!("polynomial..., time: {:?}", difference);
    }
}
