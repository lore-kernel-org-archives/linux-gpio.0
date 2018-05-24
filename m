From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3] gpio: mxc: add clock operation
Date: Thu, 24 May 2018 10:10:44 +0200
Message-ID: <CACRpkdZvS39t4s5uaBSB6bA2srQa5QmMRdfzTfyiwOJRn7FOAA@mail.gmail.com>
References: <1526958340-25883-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526958340-25883-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 22, 2018 at 5:05 AM, Anson Huang <Anson.Huang@nxp.com> wrote:

> Some i.MX SoCs have GPIO clock gates in CCM CCGR, such as
> i.MX6SLL, need to enable clocks before accessing GPIO
> registers, add optional clock operation for GPIO driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> changes since V2:

Patch applied with Fabio's review tag and using some
fuzzing, check the result in my git when you have time!

Yours,
Linus Walleij
