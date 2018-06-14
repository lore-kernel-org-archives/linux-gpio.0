From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/2] gpio: davinci: Shuffle IRQ resource fetching from
 DT to beginning of probe
Date: Thu, 14 Jun 2018 13:36:55 +0200
Message-ID: <CACRpkdbLj7SjrWjCXYVbr8sh6XWwrv_yYA5ViOe-LxQib-dLeA@mail.gmail.com>
References: <1528861237-24254-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528861237-24254-1-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Tero Kristo <t-kristo@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 13, 2018 at 5:40 AM, Keerthy <j-keerthy@ti.com> wrote:

> This is needed in case of PROBE_DEFER if IRQ resource is not yet ready.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Took out the previous version and applied this v4 instead.

Yours,
Linus Walleij
