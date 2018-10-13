From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Bug introduced in the of_get_named_gpiod_flags function.
Date: Sat, 13 Oct 2018 18:23:50 +0200
Message-ID: <CACRpkdaeBMc-wqZxh0vVXRiRMvTHDFXxOk0aaxN=swcnLBhG5w@mail.gmail.com>
References: <90dbf770-5262-5128-e585-c44d086568f9@ise.pw.edu.pl>
 <CACRpkdYQBxvHh-AfODddzc5G+BMBhUBSRXUdLVO8_99yniUYPQ@mail.gmail.com>
 <5d33d03a-5d62-c8c8-c9cc-2ccbe1b464f2@xilinx.com> <efcb67bf-bdf3-e3a8-5139-0f778ea00f1d@elektron.elka.pw.edu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <efcb67bf-bdf3-e3a8-5139-0f778ea00f1d@elektron.elka.pw.edu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: wzabolot@elektron.elka.pw.edu.pl
Cc: Michal Simek <michal.simek@xilinx.com>, wzab@ise.pw.edu.pl, Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Oct 13, 2018 at 5:53 PM wzabolot@elektron.elka.pw.edu.pl
<wzabolot@elektron.elka.pw.edu.pl> wrote:

> The question is, if there may be any other in-tree GPIO controller
> driver that does not initialize those flags?

So as I said, I looked over them and they all initialize
their flags.

> Anyway the current situation is somehow dangerous.

Not very dangerous compared to much other kernel code.

> Maybe the best solution would be to initialize the automatic variable in
> the of_find_gpio?

Patches welcom, make sure they are tested with mainline
code and drivers.

Yours.
Linus Walleij
