From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] pinctrl: zynq: Fix usb0 pins
Date: Mon, 26 Jan 2015 08:51:08 -0800
Message-ID: <1b0d387535914b48b3a720ecbe143e08@BN1AFFO11FD032.protection.gbl>
References: <1422290895-4046-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1422290895-4046-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Ola Jeppson <ola@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, 2015-01-26 at 05:48PM +0100, Andreas F=C3=A4rber wrote:
> Fix usb0 pin 19 -> 29 (matching ethernet1 pins and manual).
> Pin 19 is used for ethernet0 on the Parallella board.
>=20
> Fixes: add958cee967 ("pinctrl: Add driver for Zynq")
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
Reviewed-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

	Soren
