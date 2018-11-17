From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sdm660: Set tile property for pingroups
Date: Sat, 17 Nov 2018 13:25:37 +0100
Message-ID: <CACRpkdZMnjuJocK0VjXD7WsP2VtnF3-0=Mu_4ENiVAx9nZ+F3g@mail.gmail.com>
References: <20181112202553.1410-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181112202553.1410-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 12, 2018 at 9:26 PM Craig Tatlor <ctatlor97@gmail.com> wrote:

> This was missed when tiles support was added in a revison and
> causes the driver to fail to load.
>
> Fixes: 9cf0c526bc58 ("pinctrl: qcom: Add sdm660 pinctrl driver")
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>

Patch applied for fixes with Bj=C3=B6rn's tag!

Yours,
Linus Walleij
