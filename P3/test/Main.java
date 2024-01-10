import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        String filePath = "testfile.txt";
        int lineNumber = 0;

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.equals("v2.0 raw")) {
                    continue;
                }
                lineNumber++;
                int instruction = Integer.parseInt(line, 16);
                int opcode = (instruction & 0xFC000000) >>> 26; // 31:26;

                int addr = 0x00003000 + lineNumber * 4;
                String addrSt = Integer.toHexString(addr).toUpperCase();

                int s = (instruction & 0x3E00000) >>> 21;
                int t = (instruction & 0x1F0000) >>> 16;
                int d = (instruction & 0xF800) >>> 11;
                int funct = (instruction & 0x3F);
                short constant = (short) (instruction & 0xFFFF);
                int constant1 = instruction & 0xFFFF;
                short regOff = (short) ((instruction & 0xFFFF) << 2);

                switch (opcode) {
                    case 0x00:
                    // R-Format
                    {
                        switch (funct) {
                            case 0x20: // add
                                System.out.printf("add $%d, $%d, $%d\n", d, s, t);
                                break;

                            case 0x22: // sub
                                System.out.printf("sub $%d, $%d, $%d\n", d, s, t);
                                break;

                            case 0x24: // and
                                System.out.printf("and $%d, $%d, $%d\n", Integer.valueOf(addrSt, 16), d, s, t);
                                break;

                            case 0x25: // or
                                System.out.printf("0x%08x: or  $%d, $%d, $%d\n", Integer.valueOf(addrSt, 16), d, s, t);
                                break;

                            case 0x2A: // slt
                                System.out.printf("0x%08x: slt $%d, $%d, $%d\n", Integer.valueOf(addrSt, 16), d, s, t);
                                break;

                            case 0x00: // nop
                                System.out.printf("nop\n");
                                break;
                        }
                        break;
                    }
                    case 0x23: // lw
                    case 0x2B: // sw
                    case 0x04: // beq
                    case 0x0D: // ori
                    case 0x0F: // lui
                    case 0x05: // bne
                    {
                        // System.out.println(constant);
                        // System.out.println(negConstant);
                        // System.out.println(regOff);
                        switch (opcode) {
                            case 0x23: // lw
                                System.out.printf("lw $%d, %d($%d)\n", t, constant, s);
                                break;

                            case 0x2B: // sw
                                System.out.printf("sw $%d, %d($%d)\n", t, constant, s);
                                break;

                            case 0x0D: // ori
                                System.out.printf("ori $%d, $%d, %d\n", t, s, constant1);
                                break;

                            case 0x0F: // lui
                                System.out.printf("lui $%d, 0x%x\n", t, constant1);
                                break;

                            case 0x04: // beq
                                System.out.printf("beq $%d, $%d, %d\n", s, t, (regOff) / 4);
                                break;

                            case 0x05: // bne
                                System.out.printf("bne $%d, $%d, 0x%s\n", s, t,
                                        Integer.toHexString(regOff + (addr + 4)));
                                break;
                        }
                        break;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}