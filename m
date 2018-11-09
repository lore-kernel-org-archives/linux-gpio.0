From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: don't free unallocated ida on gpiochip_add_data_with_key()
 error path
Date: Fri, 9 Nov 2018 11:17:35 +0100
Message-ID: <CACRpkdZobk=Bx7qmAdE8QEKfEr-CK4dsfuqE0PzW=y3u34m67w@mail.gmail.com>
References: <20181102133943.7798-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181102133943.7798-1-vz@mleia.com>
Sender: stable-owner@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 2, 2018 at 2:39 PM Vladimir Zapolskiy <vz@mleia.com> wrote:

> The change corrects the error path in gpiochip_add_data_with_key()
> by avoiding to call ida_simple_remove(), if ida_simple_get() returns
> an error.
>
> Note that ida_simple_remove()/ida_free() throws a BUG(), if id argument
> is negative, it allows to easily check the correctness of the fix by
> fuzzing the return value from ida_simple_get().
>
> Fixes: ff2b13592299 ("gpio: make the gpiochip a real device")
> Cc: stable@vger.kernel.org # v4.6+
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Patch applied for fixes!

Good find Vladimir, thanks a lot.

Yours,
Linus Walleij
