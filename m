From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 6/6] pinctrl: baytrail: Add debounce configuration
Date: Mon, 4 Apr 2016 16:17:33 +0200
Message-ID: <CACRpkdZUbO6yTkh67fZwhjd9DmMU7ZuF9xOM8bgu-O9jVaYcmA@mail.gmail.com>
References: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
	<1459508407-22011-7-git-send-email-cristina.ciocan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459508407-22011-7-git-send-email-cristina.ciocan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Irina Tirdea <irina.tirdea@intel.com>, Octavian Purdila <octavian.purdila@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 1, 2016 at 1:00 PM, Cristina Ciocan
<cristina.ciocan@intel.com> wrote:

> Make debounce setting and getting functionality available when
> configurating a certain pin.
>
> Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>

Patch applied.

And as this is another case where GPIO has a debounce
setting call: gpiod_set_debounce() this is another case for
my suggested pinctrl_gpio_set_config() as that call is
currently not implemented in your corresponding .set_debounce()
callback for the GPIO chip, but could easily be handled
by calling back into the pinctrl back-end, right?

Yours,
Linus Walleij
