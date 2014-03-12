From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: max732x: Fix possible NULL pointer dereference
 on i2c_new_dummy error
Date: Wed, 12 Mar 2014 14:51:21 +0100
Message-ID: <CACRpkdZEYWmhy6+027xp+6FdRO0RM+eVkf218Q+3HjjCWOSVOg@mail.gmail.com>
References: <1394098276-11113-1-git-send-email-k.kozlowski@samsung.com>
	<1394098276-11113-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394098276-11113-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 6, 2014 at 10:31 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:

> In max732x_probe() driver allocates dummy I2C device (if number of ports
> is greater than 8) with i2c_new_dummy() but it does not check the return
> value of this call.
>
> In case of error (i2c_new_device(): memory allocation failure or I2C
> address cannot be used) this function returns NULL which is later
> dereferenced by i2c_smbus_read_byte() (called from max732x_readb()).
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Patch applied.

Yours,
Linus Walleij
