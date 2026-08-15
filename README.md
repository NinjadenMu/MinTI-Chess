# MinTI-Chess 🍃
MinTI is the world's strongest chess engine for the TI-84 Plus CE graphing calculator.

## Features
MinTI is an ambitious engine, implementing:
- Principal variation search
- Quiescence search with stand-pat and delta pruning
- 64KB transposition table
- Strong move ordering (killer heuristic, history heuristic, MVV-LVA, PV, TT moves)
- Null move pruning
- Autotuned staged evaluation
- Threefold repetition, fifty move rule, en passant, underpromotion support

Implementations are explicitly designed and optimized for the TI-84 Plus CE calculator:
- Unused VRAM frame buffers are mapped for use by MinTI's data structures
- Custom incrementally maintained additive hashing designed for the 24-bit ADL eZ80 CPU
- Incrementally maintained evaluation
- Efficient data structures for game state

Together, this allows MinTI to defeat strong existing engines such as [Chess84](https://github.com/thewarrenjames/Chess84) with 192 wins, 8 draws, 0 losses and [ChessCE/ChessCCE](https://www.ticalc.org/archives/files/fileinfo/468/46800.html) with 191 wins, 9 draws, and 0 losses<sup>*</sup>.

Playing MinTI myself, I'd estimate its strength at 2000-2100 chess[dot]com blitz, and it's a seriously challenging opponent for me.

<sup>*</sup> 200 games were played from 100 balanced early opening positions, so each engine could play both sides of the position.  Starting positions and game PGNs [here (Pastebin)](https://pastebin.com/u/NinjadenMu/1/vAAY1jwN).  
Interestingly, Chess84 beats ChessCE by a significant margin with 67 wins, 117 draws, and 16 losses, so the comparision with MinTI is somewhat non-monotonic.

## Usage
MinTI can be built for both the calculator and modern computers.  Moves may be inputted using UCI notation.

#### Host:
Clone and build with `make -f host.mk`.  Run the created `build/host/minti-host` executable.  The CE Libraries and Toolchain are not required.  Upon running `minti-host`, you will have the option to simulate the strength of MinTI's calculator build.

#### Calculator:
Install from [ticalc.org](), or clone and build with `make` using the CE Toolchain.  Both also require the CE Libraries (`clibs.8xg`) which may be downloaded [here](https://github.com/CE-Programming/libraries/releases/tag/v15.0).  Recent Texas Instruments OS versions block user assembly execution, so you may also need to install the [arTIfiCE](https://github.com/YvanTT/arTIfiCE/releases/tag/v2.1) launcher.  Send all required files to your calculator using TI Connect CE.

You can directly use your keypad to interact with MinTI's calculator GUI.  Letters can be directly typed without entering "alpha" mode.

## Future Work
MinTI's GUI and non-engine feature set are minimal right now.  I'd love to be able to add a prettier UI, as well as features like saving games and loading custom positions.

MinTI also doesn't implement late move reductions or futility pruning.  This is intentional, since reductions are tactically risky with MinTI's limited search depth on the calculator (4-5 ply), and would likely have to be quite aggressive to actually improve MinTI's search depth consistently.  That being said, I think they might work with some tuning and experimentation, so this will be a good excuse for me to revisit in the future :)
