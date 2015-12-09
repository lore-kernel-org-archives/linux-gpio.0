From: Manuel Lauss <manuel.lauss@gmail.com>
Subject: Re: [PATCH 135/182] MIPS: alchemy: switch to gpiochip_add_data()
Date: Wed, 9 Dec 2015 22:44:01 +0100
Message-ID: <CAOLZvyGe5SV044P+uje5ro+F5yHoUVqz6or4QBMfdCgXW92sbA@mail.gmail.com>
References: <1449668342-4446-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1449668342-4446-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Ralf Baechle <ralf@linux-mips.org>, Linux-MIPS <linux-mips@linux-mips.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2015 at 2:39 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> ---
> Ralf: please ACK this so I can take it through the GPIO tree.
> BTW: would be nice if the MIPS GPIO drivers could move down
> to drivers/gpio in the long run.

Is there a specific reason?  I have no objections to moving it, but
on the other hand I also like that (in this case) most/all chip-specific
code is grouped together and not scattered around the tree.

Manuel
