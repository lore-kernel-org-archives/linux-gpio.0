From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio: max732x: add error handling for i2c_new_dummy
Date: Tue, 12 Jun 2018 11:32:13 +0300
Message-ID: <CAHp75Vet9dzrJE0nzTe2HRy50UCsaSyNJueiFVrNfgtr4wmhzQ@mail.gmail.com>
References: <1528774132-38287-1-git-send-email-jiazhouyang09@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528774132-38287-1-git-send-email-jiazhouyang09@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 12, 2018 at 6:28 AM, Zhouyang Jia <jiazhouyang09@gmail.com> wrote:
> When i2c_new_dummy fails, the lack of error-handling code may
> cause unexpected results.

What results?
Where is the analisys?

Would driver work w/o these dummy devices?

-- 
With Best Regards,
Andy Shevchenko
