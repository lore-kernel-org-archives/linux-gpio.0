From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: max730x: set gpiochip data pointeur before using it
Date: Wed, 10 Aug 2016 15:41:45 +0200
Message-ID: <CACRpkdYQsunXct98C35H-i4tXBue++AUcX3rHJnmucFZ7yFXiQ@mail.gmail.com>
References: <20160808135856.465B51A2452@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160808135856.465B51A2452@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 8, 2016 at 3:58 PM, Christophe Leroy
<christophe.leroy@c-s.fr> wrote:

> gpiochip_add_data() has to be called before calling
> max7301_direction_input()

Patch applied for fixes. Sorry for patching the driver broken :(

Yours,
Linus Walleij
