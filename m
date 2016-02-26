From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 50/50] pinctrl: zynq: Use devm_pinctrl_register() for
 pinctrl registration
Date: Thu, 25 Feb 2016 19:45:15 -0800
Message-ID: <20160226034515.GA3173@xsjsorenbubuntu>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-51-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456319775-3216-51-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Michal Simek <michal.simek@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, 2016-02-24 at 18:46:15 +0530, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration and
> remove the need of .remove callback.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

	S=C3=B6ren
