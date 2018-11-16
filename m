From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mxc: move gpio noirq suspend/resume to syscore phase
Date: Fri, 16 Nov 2018 22:56:22 +0100
Message-ID: <CACRpkdY8j0kohUxRAtcfvK865EVDQXGXrB7d5+crXM4AMK1Dxg@mail.gmail.com>
References: <1541739112-383-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541739112-383-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 9, 2018 at 5:56 AM Anson Huang <anson.huang@nxp.com> wrote:

> During noirq suspend/resume phase, GPIO irq could arrive
> and its registers like IMR will be changed by irq handle
> process, to make the GPIO registers exactly when it is
> powered ON after resume, move the GPIO noirq suspend/resume
> callback to syscore suspend/resume phase, local irq is
> disabled at this phase so GPIO registers are atomic.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Patch applied. Cc Fabio so he knows it happens.

Yours,
Linus Walleij
