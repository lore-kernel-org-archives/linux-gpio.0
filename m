From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: loose DT dependence
Date: Mon, 12 Jan 2015 10:20:49 -0800
Message-ID: <52c662b797754a37966532ef95304610@BL2FFO11FD050.protection.gbl>
References: <1421020166-22831-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1421020166-22831-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, 2015-01-12 at 12:49AM +0100, Linus Walleij wrote:
> New pin controllers such as ACPI-based may also have custom propertie=
s
> to parse, and should be able to use generic pin config. Let's make th=
e
> code compile on !OF systems and rename members a bit to underscore it
> is custom parameters and not necessarily DT parameters.
>=20
> This fixes a build regression for x86_64 on the zeroday kernel builds=
=2E
>=20
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-and-tested-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

	S=C3=B6ren
