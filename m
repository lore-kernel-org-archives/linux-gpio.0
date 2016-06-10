From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/3] pinctrl: sh-pfc: add r8a7795 support for voltage switching
Date: Fri, 10 Jun 2016 09:03:33 +0200
Message-ID: <CAMuHMdWyt2e9f=8r+q9U=BLFW2R9OSh5GCnpvsMniXWahQ_qzg@mail.gmail.com>
References: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Wolfram,

On Mon, Jun 6, 2016 at 6:08 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> This series adds support for PFC voltage switching for r8a7795. I decided to
> refactor voltage switching because all Gen2 and Gen3 hardware follow the same
> style to do that. So, we can put generic handling to the core and keep only
> pin-to-bit mapping SoC specific. See patch 1 for details.
>
> Tested on a Lager board (r8a7790/H2) and a Salvator-X (r8a7795/H3) by using
> UHS/non-UHS SD cards. They work fine with SDR50 and the POCCTRL register
> setting was also verified.
>
> Branch is here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/h3-pfc-set-voltage
>
> Changes since RFC:
> * be precise in encoding which pins can do voltage switching on bank3
> * addded Geert's reviewed tag (thanks!)
>
> Please apply,
>
>    Wolfram
>
> Wolfram Sang (3):
>   pinctrl: sh-pfc: refactor voltage setting
>   pinctrl: sh-pfc: r8a7795: add support for voltage switching
>   arm64: dts: r8a7795: salvator: enable UHS for SDHI 0 & 3

Thanks for your series!

I've queued the first two patches in sh-pfc-for-v4.8, and will send a pull
request after next renesas-drivers release.

BTW, are these a hard dependency for patch 3, or will the missing power
source control just be ignored?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
