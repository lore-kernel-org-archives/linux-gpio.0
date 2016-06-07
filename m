From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 7/9] pinctrl: zynq: make it explicitly non-modular
Date: Mon, 6 Jun 2016 19:54:59 -0700
Message-ID: <20160607025459.GV3766@xsjsorenbubuntu>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
 <1465267388-17884-8-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465267388-17884-8-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, 2016-06-06 at 22:43:06 -0400, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
>=20
> config PINCTRL_ZYNQ
>         bool "Pinctrl driver for Xilinx Zynq"
>=20
> ...meaning that it currently is not being built as a module by anyone=
=2E
>=20
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>=20
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>=20
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>=20
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: "S=C3=B6ren Brinkmann" <soren.brinkmann@xilinx.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Acked-by: "S=C3=B6ren Brinkmann" <soren.brinkmann@xilinx.com>

	S=C3=B6ren
