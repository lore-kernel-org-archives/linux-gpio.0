From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] gpio: davinci: Do not assume continuous IRQ numbering
Date: Thu, 14 Jun 2018 13:39:15 +0200
Message-ID: <CACRpkdbBmEWPZBdKZNiGew5oZmFBgwnEyRG2bjpWZ0FjTEMjkw@mail.gmail.com>
References: <1528861237-24254-1-git-send-email-j-keerthy@ti.com> <1528861237-24254-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528861237-24254-2-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Tero Kristo <t-kristo@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 13, 2018 at 5:40 AM, Keerthy <j-keerthy@ti.com> wrote:

> Currently the driver assumes that the interrupts are continuous
> and does platform_get_irq only once and assumes the rest are continuous,
> instead call platform_get_irq for all the interrupts and store them
> in an array for later use.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

This v4 applied with Grygorii's ACK.

Yours,
Linus Walleij
