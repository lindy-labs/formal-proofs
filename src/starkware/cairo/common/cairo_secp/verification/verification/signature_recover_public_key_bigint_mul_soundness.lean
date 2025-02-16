/-
File: signature_recover_public_key_bigint_mul_soundness.lean

Autogenerated file.
-/
import starkware.cairo.lean.semantics.soundness.hoare
import .signature_recover_public_key_code
import ..signature_recover_public_key_spec
open tactic

open starkware.cairo.common.cairo_secp.bigint

variables {F : Type} [field F] [decidable_eq F] [prelude_hyps F]
variable  mem : F → F
variable  σ : register_state F

/- starkware.cairo.common.cairo_secp.bigint.bigint_mul autogenerated soundness theorem -/

theorem auto_sound_bigint_mul
    -- arguments
    (x y : BigInt3 F)
    -- code is in memory at σ.pc
    (h_mem : mem_at mem code_bigint_mul σ.pc)
    -- input arguments on the stack
    (hin_x : x = cast_BigInt3 mem (σ.fp - 8))
    (hin_y : y = cast_BigInt3 mem (σ.fp - 5))
    -- conclusion
  : ensures_ret mem σ (λ κ τ, τ.ap = σ.ap + 13 ∧ spec_bigint_mul mem κ x y (cast_UnreducedBigInt5 mem (τ.ap - 5))) :=
begin
  apply ensures_of_ensuresb, intro νbound,
  have h_mem_rec := h_mem,
  unpack_memory code_bigint_mul at h_mem with ⟨hpc0, hpc1, hpc2, hpc3, hpc4, hpc5, hpc6, hpc7, hpc8, hpc9, hpc10, hpc11, hpc12, hpc13⟩,
  -- return
  step_assert_eq hpc0 with hret0,
  step_assert_eq hpc1 with hret1,
  step_assert_eq hpc2 with hret2,
  step_assert_eq hpc3 with hret3,
  step_assert_eq hpc4 with hret4,
  step_assert_eq hpc5 with hret5,
  step_assert_eq hpc6 with hret6,
  step_assert_eq hpc7 with hret7,
  step_assert_eq hpc8 with hret8,
  step_assert_eq hpc9 with hret9,
  step_assert_eq hpc10 with hret10,
  step_assert_eq hpc11 with hret11,
  step_assert_eq hpc12 with hret12,
  step_ret hpc13,
  -- finish
  step_done, use_only [rfl, rfl],
  split, refl,
  -- Final Proof
  -- user-provided reduction
  suffices auto_spec: auto_spec_bigint_mul mem _ x y _,
  { apply sound_bigint_mul, apply auto_spec },
  -- prove the auto generated assertion
  dsimp [auto_spec_bigint_mul],
  try { norm_num1 }, try { arith_simps },
  try { split, linarith },
  try { ensures_simps; try { simp only [add_neg_eq_sub, hin_x, hin_y] }, },
  try { dsimp [cast_BigInt3, cast_UnreducedBigInt5] },
  try { arith_simps }, try { simp only [hret0, hret1, hret2, hret3, hret4, hret5, hret6, hret7, hret8, hret9, hret10, hret11, hret12] },
  try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },
end

