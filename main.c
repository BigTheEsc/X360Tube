#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <console/console.h>
#include <input/input.h>
#include <usb/usbmain.h>
#include <xenos/xenos.h>
#include <xenon_soc/xenon_power.h>

int main()
{
    xenos_init(VIDEO_MODE_AUTO);
    console_init();
    xenon_make_it_faster(XENON_SPEED_FULL);

    usb_init();
    usb_do_poll();

    console_clrscr();

    printf("\n");
    printf("============================================\n");
    printf("              X360Tube TEST 0.1             \n");
    printf("============================================\n\n");
    printf("             X360Tube carregado!\n\n");
    printf("        Xbox 360 Trinity + RGH\n\n");
    printf("        A  = teste de controle\n");
    printf("        Y  = sair\n\n");
    printf("============================================\n");

    struct controller_data_s pad;

    while (true)
    {
        usb_do_poll();

        if (get_controller_data(&pad, 0))
        {
            if (pad.a)
            {
                console_clrscr();
                printf("\n\n");
                printf("           X360Tube TESTE 0.1\n\n");
                printf("           CONTROLE: OK!\n\n");
                printf("           O botao A foi detectado.\n\n");
                printf("           Pressione Y para sair.\n");
            }

            if (pad.y)
                exit(0);
        }
    }

    return 0;
}
