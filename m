From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -stable] pinctrl: sh-pfc: r8a77970: remove
 SH_PFC_PIN_CFG_DRIVE_STRENGTH flag
Date: Wed, 18 Jul 2018 09:42:05 +0200
Message-ID: <CAMuHMdVLmgYqf+Ms1NH-DGf+g_GOE-NfcVS1U5squ2zOPzE-tw@mail.gmail.com>
References: <20180717152417.8535-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180717152417.8535-1-niklas.soderlund+renesas@ragnatech.se>
Sender: stable-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: stable <stable@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

Thanks for your backport!

On Tue, Jul 17, 2018 at 5:24 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:

commit 550b6f7e8cf93fc2753aa01e655ed5471012ab5a upstream.

> The datasheet does not document any registers to control drive strength,
> and no drive strength registers are for this reason described for this
> SoC. The flags indicating that drive strength can be controlled are
> however set for some pins in the driver.
>
> This leads to a NULL pointer dereference when the sh-pfc core tries to
> access the struct describing the drive strength registers, for example
> when reading the sysfs file pinconf-pins.
>
> Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins
>
> Fixes: b92ac66a1819602b ("pinctrl: sh-pfc: Add R8A77970 PFC support")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---

> This is a backport of commit 550b6f7e8cf93fc2753aa01e655ed5471012ab5a
> from Linusw linux-pinctrl.git tree. It's applicable for v4.16 and v4.17.

Which is now upstream.

Gr{oetje,eeting}s,

                        Geert
