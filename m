From: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 25/35 linux-next] PCI: constify of_device_id array
Date: Mon, 16 Mar 2015 21:30:32 +0100 (CET)
Message-ID: <195534809.1144303.1426537832550.open-xchange@webmail.nmp.proximus.be>
References: <1426533469-25458-1-git-send-email-fabf@skynet.be> <1426535685-25996-1-git-send-email-fabf@skynet.be> <1426535685-25996-4-git-send-email-fabf@skynet.be> <55073BC0.3020009@cogentembedded.com>
Reply-To: Fabian Frederick <fabf@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55073BC0.3020009@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-sh@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: linux-gpio@vger.kernel.org



> On 16 March 2015 at 21:23 Sergei Shtylyov <sergei.shtylyov@cogentembe=
dded.com>
> wrote:
>
>
> Hello.
>
> On 03/16/2015 10:54 PM, Fabian Frederick wrote:
>
> > of_device_id is always used as const.
> > (See driver.of_match_table and open firmware functions)
>
> > Signed-off-by: Fabian Frederick <fabf@skynet.be>
> > ---
> >=C2=A0 =C2=A0drivers/gpio/gpio-mpc8xxx.c=C2=A0 =C2=A0 =C2=A0 | 2 +-
> >=C2=A0 =C2=A0drivers/gpio/gpio-octeon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-
> >=C2=A0 =C2=A0drivers/gpio/gpio-tz1090-pdc.c=C2=A0 =C2=A0| 2 +-
> >=C2=A0 =C2=A0drivers/gpio/gpio-tz1090.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-
> >=C2=A0 =C2=A0drivers/gpio/gpio-zynq.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-
>
>=C2=A0 =C2=A0 =C2=A0What the GPIO driver changes are doing here, in th=
e PCI patch?
Nice catch :) I'll split that patch and only send those to avoid too mu=
ch noise.

Thanks,
=46abian

>
> >=C2=A0 =C2=A0drivers/pci/host/pci-rcar-gen2.c | 2 +-
> >=C2=A0 =C2=A0drivers/pci/host/pcie-xilinx.c=C2=A0 =C2=A0| 2 +-
> >=C2=A0 =C2=A07 files changed, 7 insertions(+), 7 deletions(-)
>
> [...]
>
> WBR, Sergei
>
