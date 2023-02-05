use snarkvm_utilities::BigInteger256;
use snarkvm_curves::bls12_377::{Fr, G1Affine, Bls12_377G1Parameters};
use snarkvm_fields::PrimeField;
use snarkvm_utilities::rand::TestRng;
use snarkvm_curves::AffineCurve;
use snarkvm_curves::templates::short_weierstrass_jacobian::Projective;
use snarkvm_algorithms_cuda::msm;
use std::time::SystemTime;


fn create_scalar_bases<G: AffineCurve<ScalarField = F>, F: PrimeField>(size: usize) -> (Vec<G>, Vec<F::BigInteger>) {
    
    let mut rng = TestRng::default();

    let bases = std::iter::repeat((0..size/1000).into_iter().map(|_| G::rand(&mut rng)).collect::<Vec<_>>())
        .take(1000)
        .flatten()
        .collect::<Vec<_>>();

    let scalars = (0..size).into_iter().map(|_| F::rand(&mut rng).to_bigint()).collect::<Vec<_>>();
    
    (bases, scalars)
}


fn main() {

    let (bases_t, scalars_t) = create_scalar_bases::<G1Affine, Fr>(17000);

    let bases = &bases_t[0..16384];
    let scalars = &scalars_t[0..16384];


    for _i in 1..20 {
         
        let sys_time1 = SystemTime::now();

        let ret = msm::<snarkvm_curves::templates::short_weierstrass_jacobian::Affine<Bls12_377G1Parameters>, Projective<Bls12_377G1Parameters>, BigInteger256>(&bases, &scalars);

        //println!("{:#?}", ret);

        let sys_time2 = SystemTime::now();
        let difference = sys_time2.duration_since(sys_time1);
        println!("cuda::msm: check_outside..., time: {:?}", difference);

    }

}
