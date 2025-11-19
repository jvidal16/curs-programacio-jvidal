import 'dart:io';

void main() async {
    // Codis ANSI per colors
    const green = '\x1B[38;5;154m';
    const red = '\x1B[31m';
    const reset = '\x1B[0m';

   const brailleFrames = ['⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'];
   // Seqüència de 10 colors rainbow
  final rainbow = [
    '\x1B[38;5;196m', // Vermell fosc
    '\x1B[38;5;202m', // Vermell-taronja
    '\x1B[38;5;208m', // Taronja
    '\x1B[38;5;214m', // Taronja clar
    '\x1B[38;5;220m', // Groc-taronja
    '\x1B[38;5;226m', // Groc
    '\x1B[38;5;190m', // Groc-verd
    '\x1B[38;5;154m', // Verd clar
    '\x1B[38;5;118m', // Verd
    '\x1B[38;5;45m',  // Cian
    '\x1B[38;5;39m',  // Blau clar
    '\x1B[38;5;33m',  // Blau
    '\x1B[38;5;57m',  // Blau fosc
    '\x1B[38;5;93m',  // Violeta
    '\x1B[38;5;129m', // Magenta
  ];


   // Amagar cursor
   stdout.write('\x1B[?25l');

   for(int i=0; i <100; i++){
    stdout.write('\r ${rainbow[i % 15]}${brailleFrames[i % 10]}');

    await Future.delayed(Duration(milliseconds: 100)); 

   }

   // Mostrar cursor sempre (fins i tot si hi ha error)
    stdout.write('\x1B[?25h');
    
    stdout.write('\r $reset $green✔ Completat!        \n$reset');
}