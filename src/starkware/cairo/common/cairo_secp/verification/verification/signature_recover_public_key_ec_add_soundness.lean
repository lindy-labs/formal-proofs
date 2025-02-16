/-
File: signature_recover_public_key_ec_add_soundness.lean

Autogenerated file.
-/
import starkware.cairo.lean.semantics.soundness.hoare
import .signature_recover_public_key_code
import ..signature_recover_public_key_spec
import .signature_recover_public_key_fast_ec_add_soundness
import .signature_recover_public_key_is_zero_soundness
import .signature_recover_public_key_ec_double_soundness
open tactic

open starkware.cairo.common.cairo_secp.ec
open starkware.cairo.common.cairo_secp.bigint
open starkware.cairo.common.cairo_secp.field

variables {F : Type} [field F] [decidable_eq F] [prelude_hyps F]
variable  mem : F → F
variable  σ : register_state F

/- starkware.cairo.common.cairo_secp.ec.ec_add autogenerated soundness theorem -/

theorem auto_sound_ec_add
    -- arguments
    (range_check_ptr : F) (point0 point1 : EcPoint F)
    -- code is in memory at σ.pc
    (h_mem : mem_at mem code_ec_add σ.pc)
    -- all dependencies are in memory
    (h_mem_4 : mem_at mem code_nondet_bigint3 (σ.pc  - 404))
    (h_mem_5 : mem_at mem code_unreduced_mul (σ.pc  - 392))
    (h_mem_6 : mem_at mem code_unreduced_sqr (σ.pc  - 372))
    (h_mem_7 : mem_at mem code_verify_zero (σ.pc  - 356))
    (h_mem_8 : mem_at mem code_is_zero (σ.pc  - 333))
    (h_mem_12 : mem_at mem code_compute_doubling_slope (σ.pc  - 228))
    (h_mem_13 : mem_at mem code_compute_slope (σ.pc  - 184))
    (h_mem_14 : mem_at mem code_ec_double (σ.pc  - 160))
    (h_mem_15 : mem_at mem code_fast_ec_add (σ.pc  - 87))
    -- input arguments on the stack
    (hin_range_check_ptr : range_check_ptr = mem (σ.fp - 15))
    (hin_point0 : point0 = cast_EcPoint mem (σ.fp - 14))
    (hin_point1 : point1 = cast_EcPoint mem (σ.fp - 8))
    -- conclusion
  : ensures_ret mem σ (λ κ τ,
      ∃ μ ≤ κ, rc_ensures mem (rc_bound F) μ (mem (σ.fp - 15)) (mem $ τ.ap - 7)
        (spec_ec_add mem κ range_check_ptr point0 point1 (mem (τ.ap - 7)) (cast_EcPoint mem (τ.ap - 6)))) :=
begin
  apply ensures_of_ensuresb, intro νbound,
  have h_mem_rec := h_mem,
  unpack_memory code_ec_add at h_mem with ⟨hpc0, hpc1, hpc2, hpc3, hpc4, hpc5, hpc6, hpc7, hpc8, hpc9, hpc10, hpc11, hpc12, hpc13, hpc14, hpc15, hpc16, hpc17, hpc18, hpc19, hpc20, hpc21, hpc22, hpc23, hpc24, hpc25, hpc26, hpc27, hpc28, hpc29, hpc30, hpc31, hpc32, hpc33, hpc34, hpc35, hpc36, hpc37, hpc38, hpc39, hpc40, hpc41, hpc42, hpc43, hpc44, hpc45, hpc46, hpc47, hpc48, hpc49, hpc50, hpc51, hpc52, hpc53, hpc54, hpc55⟩,
  -- let
  generalize' hl_rev_x_diff: ({
    d0 := point0.x.d0 - point1.x.d0,
    d1 := point0.x.d1 - point1.x.d1,
    d2 := point0.x.d2 - point1.x.d2
  } : BigInt3 F) = x_diff,
  have hl_x_diff := hl_rev_x_diff.symm, clear hl_rev_x_diff,
  try { dsimp at hl_x_diff }, try { arith_simps at hl_x_diff },
  -- function call
  step_assert_eq hpc0 with arg0,
  step_assert_eq hpc1 with arg1,
  step_assert_eq hpc2 with arg2,
  step_assert_eq hpc3 with arg3,
  step_sub hpc4 (auto_sound_is_zero mem _ range_check_ptr x_diff _ _ _ _ _ _),
  { rw hpc5, norm_num2, exact h_mem_8 },
  { rw hpc5, norm_num2, exact h_mem_4 },
  { rw hpc5, norm_num2, exact h_mem_5 },
  { rw hpc5, norm_num2, exact h_mem_7 },
  { try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff] },
    try { dsimp [cast_EcPoint, cast_BigInt3] },
    try { arith_simps }, try { simp only [arg0, (eq_sub_of_eq_add arg1), (eq_sub_of_eq_add arg2), (eq_sub_of_eq_add arg3)] },
    try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } }, },
  { try { ext } ; {
      try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff] },
      try { dsimp [cast_EcPoint, cast_BigInt3] },
      try { arith_simps }, try { simp only [arg0, (eq_sub_of_eq_add arg1), (eq_sub_of_eq_add arg2), (eq_sub_of_eq_add arg3)] },
      try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },}, },
  intros κ_call6 ap6 h_call6,
  rcases h_call6 with ⟨rc_m6, rc_mle6, hl_range_check_ptr₁, h_call6⟩,
  generalize' hr_rev_range_check_ptr₁: mem (ap6 - 2) = range_check_ptr₁,
  have htv_range_check_ptr₁ := hr_rev_range_check_ptr₁.symm, clear hr_rev_range_check_ptr₁,
  generalize' hr_rev_same_x: mem (ap6 - 1) = same_x,
  simp only [hr_rev_same_x] at h_call6,
  have htv_same_x := hr_rev_same_x.symm, clear hr_rev_same_x,
  try { simp only [arg0 ,arg1 ,arg2 ,arg3] at hl_range_check_ptr₁ },
  rw [←htv_range_check_ptr₁, ←hin_range_check_ptr] at hl_range_check_ptr₁,
  try { simp only [arg0 ,arg1 ,arg2 ,arg3] at h_call6 },
  rw [hin_range_check_ptr] at h_call6,
  clear arg0 arg1 arg2 arg3,
  -- if statement
  step_jnz hpc6 hpc7 with hcond hcond,
  {
    -- if: positive branch
    have a6 : same_x = 0, {
      try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x] },
      try { dsimp [cast_EcPoint, cast_BigInt3] },
      try { arith_simps }, try { simp only [hcond] },
      try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },
    },
    try { dsimp at a6 }, try { arith_simps at a6 },
    clear hcond,
    -- tail function call
    step_assert_eq hpc8 with arg0,
    step_assert_eq hpc9 with arg1,
    step_assert_eq hpc10 with arg2,
    step_assert_eq hpc11 with arg3,
    step_assert_eq hpc12 with arg4,
    step_assert_eq hpc13 with arg5,
    step_assert_eq hpc14 with arg6,
    step_assert_eq hpc15 with arg7,
    step_assert_eq hpc16 with arg8,
    step_assert_eq hpc17 with arg9,
    step_assert_eq hpc18 with arg10,
    step_assert_eq hpc19 with arg11,
    step_assert_eq hpc20 with arg12,
    step_sub hpc21 (auto_sound_fast_ec_add mem _ range_check_ptr₁ point0 point1 _ _ _ _ _ _ _ _ _),
    { rw hpc22, norm_num2, exact h_mem_15 },
    { rw hpc22, norm_num2, exact h_mem_4 },
    { rw hpc22, norm_num2, exact h_mem_5 },
    { rw hpc22, norm_num2, exact h_mem_6 },
    { rw hpc22, norm_num2, exact h_mem_7 },
    { rw hpc22, norm_num2, exact h_mem_13 },
    { try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x] },
      try { dsimp [cast_EcPoint, cast_BigInt3] },
      try { arith_simps }, try { simp only [arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12] },
      try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } }, },
    { try { ext } ; {
        try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x] },
        try { dsimp [cast_EcPoint, cast_BigInt3] },
        try { arith_simps }, try { simp only [arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12] },
        try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },}, },
    { try { ext } ; {
        try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x] },
        try { dsimp [cast_EcPoint, cast_BigInt3] },
        try { arith_simps }, try { simp only [arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12] },
        try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },}, },
    intros κ_call23 ap23 h_call23,
    rcases h_call23 with ⟨rc_m23, rc_mle23, hl_range_check_ptr₂, h_call23⟩,
    step_ret hpc23,
    generalize' hr_rev_range_check_ptr₂: mem (ap23 - 7) = range_check_ptr₂,
    have htv_range_check_ptr₂ := hr_rev_range_check_ptr₂.symm, clear hr_rev_range_check_ptr₂,
    try { simp only [arg0 ,arg1 ,arg2 ,arg3 ,arg4 ,arg5 ,arg6 ,arg7 ,arg8 ,arg9 ,arg10 ,arg11 ,arg12] at hl_range_check_ptr₂ },
    rw [←htv_range_check_ptr₂, ←htv_range_check_ptr₁] at hl_range_check_ptr₂,
    try { simp only [arg0 ,arg1 ,arg2 ,arg3 ,arg4 ,arg5 ,arg6 ,arg7 ,arg8 ,arg9 ,arg10 ,arg11 ,arg12] at h_call23 },
    rw [←htv_range_check_ptr₁, hl_range_check_ptr₁, hin_range_check_ptr] at h_call23,
    clear arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9 arg10 arg11 arg12,
    -- finish
    step_done, use_only [rfl, rfl],
    -- range check condition
    use_only (rc_m6+rc_m23+0+0), split,
    linarith [rc_mle6, rc_mle23],
    split,
    { arith_simps,
      rw [←htv_range_check_ptr₂, hl_range_check_ptr₂, hl_range_check_ptr₁, hin_range_check_ptr],
      try { arith_simps, refl <|> norm_cast }, try { refl } },
    intro rc_h_range_check_ptr, repeat { rw [add_assoc] at rc_h_range_check_ptr },
    have rc_h_range_check_ptr' := range_checked_add_right rc_h_range_check_ptr,
    -- Final Proof
    -- user-provided reduction
    suffices auto_spec: auto_spec_ec_add mem _ range_check_ptr point0 point1 _ _,
    { apply sound_ec_add, apply auto_spec },
    -- prove the auto generated assertion
    dsimp [auto_spec_ec_add],
    try { norm_num1 }, try { arith_simps },
    use_only [x_diff, hl_x_diff],
    use_only [κ_call6],
    use_only [range_check_ptr₁],
    use_only [same_x],
    have rc_h_range_check_ptr₁ := range_checked_offset' rc_h_range_check_ptr,
    have rc_h_range_check_ptr₁' := range_checked_add_right rc_h_range_check_ptr₁, try { norm_cast at rc_h_range_check_ptr₁' },
    have spec6 := h_call6 rc_h_range_check_ptr',
    rw [←hin_range_check_ptr, ←htv_range_check_ptr₁] at spec6,
    try { dsimp at spec6, arith_simps at spec6 },
    use_only [spec6],
    left,
    use_only [a6],
    use_only [κ_call23],
    have rc_h_range_check_ptr₂ := range_checked_offset' rc_h_range_check_ptr₁,
    have rc_h_range_check_ptr₂' := range_checked_add_right rc_h_range_check_ptr₂, try { norm_cast at rc_h_range_check_ptr₂' },
    have spec23 := h_call23 rc_h_range_check_ptr₁',
    rw [←hin_range_check_ptr, ←hl_range_check_ptr₁] at spec23,
    try { dsimp at spec23, arith_simps at spec23 },
    use_only [spec23],
    try { linarith },
  },
  {
    -- if: negative branch
    have a6 : same_x ≠ 0, {
      try { simp only [ne.def] },
      try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x] },
      try { dsimp [cast_EcPoint, cast_BigInt3] },
      try { arith_simps }, try { simp only [hcond] },
      try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },
    },
    try { dsimp at a6 }, try { arith_simps at a6 },
    clear hcond,
    -- let
    generalize' hl_rev_y_sum: ({
      d0 := point0.y.d0 + point1.y.d0,
      d1 := point0.y.d1 + point1.y.d1,
      d2 := point0.y.d2 + point1.y.d2
    } : BigInt3 F) = y_sum,
    have hl_y_sum := hl_rev_y_sum.symm, clear hl_rev_y_sum,
    try { dsimp at hl_y_sum }, try { arith_simps at hl_y_sum },
    -- function call
    step_assert_eq hpc24 with arg0,
    step_assert_eq hpc25 with arg1,
    step_assert_eq hpc26 with arg2,
    step_assert_eq hpc27 with arg3,
    step_sub hpc28 (auto_sound_is_zero mem _ range_check_ptr₁ y_sum _ _ _ _ _ _),
    { rw hpc29, norm_num2, exact h_mem_8 },
    { rw hpc29, norm_num2, exact h_mem_4 },
    { rw hpc29, norm_num2, exact h_mem_5 },
    { rw hpc29, norm_num2, exact h_mem_7 },
    { try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x, hl_y_sum] },
      try { dsimp [cast_EcPoint, cast_BigInt3] },
      try { arith_simps }, try { simp only [arg0, arg1, arg2, arg3] },
      try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } }, },
    { try { ext } ; {
        try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x, hl_y_sum] },
        try { dsimp [cast_EcPoint, cast_BigInt3] },
        try { arith_simps }, try { simp only [arg0, arg1, arg2, arg3] },
        try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },}, },
    intros κ_call30 ap30 h_call30,
    rcases h_call30 with ⟨rc_m30, rc_mle30, hl_range_check_ptr₂, h_call30⟩,
    generalize' hr_rev_range_check_ptr₂: mem (ap30 - 2) = range_check_ptr₂,
    have htv_range_check_ptr₂ := hr_rev_range_check_ptr₂.symm, clear hr_rev_range_check_ptr₂,
    generalize' hr_rev_opposite_y: mem (ap30 - 1) = opposite_y,
    simp only [hr_rev_opposite_y] at h_call30,
    have htv_opposite_y := hr_rev_opposite_y.symm, clear hr_rev_opposite_y,
    try { simp only [arg0 ,arg1 ,arg2 ,arg3] at hl_range_check_ptr₂ },
    rw [←htv_range_check_ptr₂, ←htv_range_check_ptr₁] at hl_range_check_ptr₂,
    try { simp only [arg0 ,arg1 ,arg2 ,arg3] at h_call30 },
    rw [←htv_range_check_ptr₁, hl_range_check_ptr₁, hin_range_check_ptr] at h_call30,
    clear arg0 arg1 arg2 arg3,
    -- if statement
    step_jnz hpc30 hpc31 with hcond hcond,
    {
      -- if: positive branch
      have a30 : opposite_y = 0, {
        try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x, hl_y_sum, htv_range_check_ptr₂, htv_opposite_y] },
        try { dsimp [cast_EcPoint, cast_BigInt3] },
        try { arith_simps }, try { simp only [hcond] },
        try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },
      },
      try { dsimp at a30 }, try { arith_simps at a30 },
      clear hcond,
      -- tail function call
      step_assert_eq hpc32 with arg0,
      step_assert_eq hpc33 with arg1,
      step_assert_eq hpc34 with arg2,
      step_assert_eq hpc35 with arg3,
      step_assert_eq hpc36 with arg4,
      step_assert_eq hpc37 with arg5,
      step_assert_eq hpc38 with arg6,
      step_sub hpc39 (auto_sound_ec_double mem _ range_check_ptr₂ point0 _ _ _ _ _ _ _ _),
      { rw hpc40, norm_num2, exact h_mem_14 },
      { rw hpc40, norm_num2, exact h_mem_4 },
      { rw hpc40, norm_num2, exact h_mem_5 },
      { rw hpc40, norm_num2, exact h_mem_6 },
      { rw hpc40, norm_num2, exact h_mem_7 },
      { rw hpc40, norm_num2, exact h_mem_12 },
      { try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x, hl_y_sum, htv_range_check_ptr₂, htv_opposite_y] },
        try { dsimp [cast_EcPoint, cast_BigInt3] },
        try { arith_simps }, try { simp only [arg0, arg1, arg2, arg3, arg4, arg5, arg6] },
        try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } }, },
      { try { ext } ; {
          try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x, hl_y_sum, htv_range_check_ptr₂, htv_opposite_y] },
          try { dsimp [cast_EcPoint, cast_BigInt3] },
          try { arith_simps }, try { simp only [arg0, arg1, arg2, arg3, arg4, arg5, arg6] },
          try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },}, },
      intros κ_call41 ap41 h_call41,
      rcases h_call41 with ⟨rc_m41, rc_mle41, hl_range_check_ptr₃, h_call41⟩,
      step_ret hpc41,
      generalize' hr_rev_range_check_ptr₃: mem (ap41 - 7) = range_check_ptr₃,
      have htv_range_check_ptr₃ := hr_rev_range_check_ptr₃.symm, clear hr_rev_range_check_ptr₃,
      try { simp only [arg0 ,arg1 ,arg2 ,arg3 ,arg4 ,arg5 ,arg6] at hl_range_check_ptr₃ },
      rw [←htv_range_check_ptr₃, ←htv_range_check_ptr₂] at hl_range_check_ptr₃,
      try { simp only [arg0 ,arg1 ,arg2 ,arg3 ,arg4 ,arg5 ,arg6] at h_call41 },
      rw [←htv_range_check_ptr₂, hl_range_check_ptr₂, hl_range_check_ptr₁, hin_range_check_ptr] at h_call41,
      clear arg0 arg1 arg2 arg3 arg4 arg5 arg6,
      -- finish
      step_done, use_only [rfl, rfl],
      -- range check condition
      use_only (rc_m6+rc_m30+rc_m41+0+0), split,
      linarith [rc_mle6, rc_mle30, rc_mle41],
      split,
      { arith_simps,
        rw [←htv_range_check_ptr₃, hl_range_check_ptr₃, hl_range_check_ptr₂, hl_range_check_ptr₁, hin_range_check_ptr],
        try { arith_simps, refl <|> norm_cast }, try { refl } },
      intro rc_h_range_check_ptr, repeat { rw [add_assoc] at rc_h_range_check_ptr },
      have rc_h_range_check_ptr' := range_checked_add_right rc_h_range_check_ptr,
      -- Final Proof
      -- user-provided reduction
      suffices auto_spec: auto_spec_ec_add mem _ range_check_ptr point0 point1 _ _,
      { apply sound_ec_add, apply auto_spec },
      -- prove the auto generated assertion
      dsimp [auto_spec_ec_add],
      try { norm_num1 }, try { arith_simps },
      use_only [x_diff, hl_x_diff],
      use_only [κ_call6],
      use_only [range_check_ptr₁],
      use_only [same_x],
      have rc_h_range_check_ptr₁ := range_checked_offset' rc_h_range_check_ptr,
      have rc_h_range_check_ptr₁' := range_checked_add_right rc_h_range_check_ptr₁, try { norm_cast at rc_h_range_check_ptr₁' },
      have spec6 := h_call6 rc_h_range_check_ptr',
      rw [←hin_range_check_ptr, ←htv_range_check_ptr₁] at spec6,
      try { dsimp at spec6, arith_simps at spec6 },
      use_only [spec6],
      right,
      use_only [a6],
      use_only [y_sum, hl_y_sum],
      use_only [κ_call30],
      use_only [range_check_ptr₂],
      use_only [opposite_y],
      have rc_h_range_check_ptr₂ := range_checked_offset' rc_h_range_check_ptr₁,
      have rc_h_range_check_ptr₂' := range_checked_add_right rc_h_range_check_ptr₂, try { norm_cast at rc_h_range_check_ptr₂' },
      have spec30 := h_call30 rc_h_range_check_ptr₁',
      rw [←hin_range_check_ptr, ←hl_range_check_ptr₁, ←htv_range_check_ptr₂] at spec30,
      try { dsimp at spec30, arith_simps at spec30 },
      use_only [spec30],
      right,
      use_only [a30],
      use_only [κ_call41],
      have rc_h_range_check_ptr₃ := range_checked_offset' rc_h_range_check_ptr₂,
      have rc_h_range_check_ptr₃' := range_checked_add_right rc_h_range_check_ptr₃, try { norm_cast at rc_h_range_check_ptr₃' },
      have spec41 := h_call41 rc_h_range_check_ptr₂',
      rw [←hin_range_check_ptr, ←hl_range_check_ptr₁, ←hl_range_check_ptr₂] at spec41,
      try { dsimp at spec41, arith_simps at spec41 },
      use_only [spec41],
      try { linarith },
    },
    {
      -- if: negative branch
      have a30 : opposite_y ≠ 0, {
        try { simp only [ne.def] },
        try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x, hl_y_sum, htv_range_check_ptr₂, htv_opposite_y] },
        try { dsimp [cast_EcPoint, cast_BigInt3] },
        try { arith_simps }, try { simp only [hcond] },
        try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },
      },
      try { dsimp at a30 }, try { arith_simps at a30 },
      clear hcond,
      -- let
      generalize' hl_rev_ZERO_POINT: ({
        x := { d0 := 0, d1 := 0, d2 := 0 },
        y := { d0 := 0, d1 := 0, d2 := 0 }
      } : EcPoint F) = ZERO_POINT,
      have hl_ZERO_POINT := hl_rev_ZERO_POINT.symm, clear hl_rev_ZERO_POINT,
      try { dsimp at hl_ZERO_POINT }, try { arith_simps at hl_ZERO_POINT },
      -- return
      step_assert_eq hpc42 with hret0,
      step_assert_eq hpc43 hpc44 with hret1,
      step_assert_eq hpc45 hpc46 with hret2,
      step_assert_eq hpc47 hpc48 with hret3,
      step_assert_eq hpc49 hpc50 with hret4,
      step_assert_eq hpc51 hpc52 with hret5,
      step_assert_eq hpc53 hpc54 with hret6,
      step_ret hpc55,
      -- finish
      step_done, use_only [rfl, rfl],
      -- range check condition
      use_only (rc_m6+rc_m30+0+0), split,
      linarith [rc_mle6, rc_mle30],
      split,
      { arith_simps, try { simp only [hret0 ,hret1 ,hret2 ,hret3 ,hret4 ,hret5 ,hret6] },
        rw [←htv_range_check_ptr₂, hl_range_check_ptr₂, hl_range_check_ptr₁, hin_range_check_ptr],
        try { arith_simps, refl <|> norm_cast }, try { refl } },
      intro rc_h_range_check_ptr, repeat { rw [add_assoc] at rc_h_range_check_ptr },
      have rc_h_range_check_ptr' := range_checked_add_right rc_h_range_check_ptr,
      -- Final Proof
      -- user-provided reduction
      suffices auto_spec: auto_spec_ec_add mem _ range_check_ptr point0 point1 _ _,
      { apply sound_ec_add, apply auto_spec },
      -- prove the auto generated assertion
      dsimp [auto_spec_ec_add],
      try { norm_num1 }, try { arith_simps },
      use_only [x_diff, hl_x_diff],
      use_only [κ_call6],
      use_only [range_check_ptr₁],
      use_only [same_x],
      have rc_h_range_check_ptr₁ := range_checked_offset' rc_h_range_check_ptr,
      have rc_h_range_check_ptr₁' := range_checked_add_right rc_h_range_check_ptr₁, try { norm_cast at rc_h_range_check_ptr₁' },
      have spec6 := h_call6 rc_h_range_check_ptr',
      rw [←hin_range_check_ptr, ←htv_range_check_ptr₁] at spec6,
      try { dsimp at spec6, arith_simps at spec6 },
      use_only [spec6],
      right,
      use_only [a6],
      use_only [y_sum, hl_y_sum],
      use_only [κ_call30],
      use_only [range_check_ptr₂],
      use_only [opposite_y],
      have rc_h_range_check_ptr₂ := range_checked_offset' rc_h_range_check_ptr₁,
      have rc_h_range_check_ptr₂' := range_checked_add_right rc_h_range_check_ptr₂, try { norm_cast at rc_h_range_check_ptr₂' },
      have spec30 := h_call30 rc_h_range_check_ptr₁',
      rw [←hin_range_check_ptr, ←hl_range_check_ptr₁, ←htv_range_check_ptr₂] at spec30,
      try { dsimp at spec30, arith_simps at spec30 },
      use_only [spec30],
      left,
      use_only [a30],
      use_only [ZERO_POINT, hl_ZERO_POINT],
      try { split, linarith },
      try { ensures_simps; try { simp only [add_neg_eq_sub, hin_range_check_ptr, hin_point0, hin_point1, hl_x_diff, htv_range_check_ptr₁, htv_same_x, hl_y_sum, htv_range_check_ptr₂, htv_opposite_y, hl_ZERO_POINT] }, },
      try { dsimp [cast_EcPoint, cast_BigInt3] },
      try { arith_simps }, try { simp only [hret0, hret1, hret2, hret3, hret4, hret5, hret6] },
      try { arith_simps; try { split }; triv <|> refl <|> simp <|> abel; try { norm_num } },
    }
  }
end

