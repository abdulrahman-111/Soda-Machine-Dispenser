# Soda Machine Dispenser Project

## Description

The **Soda Machine Dispenser Project** is a Finite State Machine (FSM) designed for the Digital Systems Design course (ECE 115) to control a soda vending machine. The machine accepts nickels (5¢), dimes (10¢), and quarters (25¢), dispensing a soda and returning any necessary change once the total inserted amount reaches 25¢. Implemented in Verilog, the project includes the FSM design, a testbench for verifying functionality, and simulation results visualized through waveforms. The system efficiently handles coin inputs, state transitions, reset, and clock signals, ensuring correct soda dispensing and change return.

## Project Structure

- **osleha_lla_allah_new.v**: Verilog module implementing the FSM for the soda vending machine.
- **vprojnew.v**: Verilog testbench module to simulate and verify FSM functionality across various coin input scenarios.
- **Documentation.pdf**: Project report detailing the FSM design, testing scenarios, simulation results, and team contributions.
- **README.md**: This file, providing an overview and instructions for the project.

## Prerequisites

- **Verilog Simulator**: A tool like ModelSim or Vivado is required to simulate the Verilog code.
- **Verilog Files**: Ensure `osleha_lla_allah_new.v` and `vprojnew.v` are available in the project directory.
- **Documentation**: Refer to `Documentation.pdf` for detailed design and testing information.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/soda-machine-dispenser.git
   ```
2. Ensure the Verilog files (`osleha_lla_allah_new.v`, `vprojnew.v`) are in the project directory.
3. Open your Verilog simulation tool (e.g., ModelSim or Vivado) and set up the project directory.

## Usage

1. Load the Verilog files (`osleha_lla_allah_new.v` and `vprojnew.v`) into your Verilog simulator.
2. Compile the Verilog modules:
   - First, compile `osleha_lla_allah_new.v` (the FSM module).
   - Then, compile `vprojnew.v` (the testbench module).
3. Run the simulation to test the FSM with various coin input scenarios (e.g., 1 dime + 1 quarter).
4. Observe the waveform outputs to verify correct behavior (e.g., soda dispensed, correct change returned).
5. Review `Documentation.pdf` for detailed analysis of the FSM design, test cases, and simulation results.

## Key Features

- **FSM Design**: Implements a Moore FSM to track coin inputs (nickels, dimes, quarters), dispense a soda at 25¢, and return change (nickel, dime, or two dimes).
- **Inputs**: 
  - Coin inputs: `N` (nickel, 5¢), `D` (dime, 10¢), `Q` (quarter, 25¢).
  - Control signals: `rst` (reset), `clk` (clock).
- **Outputs**: 
  - `dis` (dispense soda).
  - `ON` (return nickel), `OD` (return dime), `O2D` (return two dimes).
- **Testbench**: Simulates various coin input combinations (e.g., 1 dime + 1 quarter, 5 nickels) to verify FSM functionality.
- **Simulation**: Waveform outputs confirm correct state transitions, dispensing, and change return.
- **Reset Functionality**: Resets the FSM to the initial state (`s0`) when `rst` is high.

## Example Test Case

- **Test Case 6 (1 Dime + 1 Quarter)**:
  - Input: `D = 1` (dime inserted), then `Q = 1` (quarter inserted).
  - Expected Output: `dis = 1` (soda dispensed), no change returned (total = 35¢ - 25¢ = 10¢, no valid change combination).
  - Waveform: Confirms state transitions and correct output signals.

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.

## Authors

- Team: **5leha 3la Allah**
- Instructor: Dr. Hany M. Zamil
- Teaching Assistant: Eng. Amr Al-Iraqi

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- The project was developed as part of the Digital Systems Design course (ECE 115).
- Special thanks to Dr. Hany M. Zamil and Eng. Amr Al-Iraqi for guidance and support.