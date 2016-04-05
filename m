From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: Re: [PATCH v4 6/6] pinctrl: baytrail: Add debounce configuration
Date: Tue, 5 Apr 2016 14:18:19 +0300
Message-ID: <57039EFB.4080508@intel.com>
References: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
 <1459508407-22011-7-git-send-email-cristina.ciocan@intel.com>
 <CACRpkdZUbO6yTkh67fZwhjd9DmMU7ZuF9xOM8bgu-O9jVaYcmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:53071 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757479AbcDELO7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 07:14:59 -0400
In-Reply-To: <CACRpkdZUbO6yTkh67fZwhjd9DmMU7ZuF9xOM8bgu-O9jVaYcmA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Irina Tirdea <irina.tirdea@intel.com>, Octavian Purdila <octavian.purdila@intel.com>

On 04.04.2016 17:17, Linus Walleij wrote:
> On Fri, Apr 1, 2016 at 1:00 PM, Cristina Ciocan
> <cristina.ciocan@intel.com> wrote:
> 
>> Make debounce setting and getting functionality available when
>> configurating a certain pin.
>>
>> Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>
> 
> Patch applied.
> 
> And as this is another case where GPIO has a debounce
> setting call: gpiod_set_debounce() this is another case for
> my suggested pinctrl_gpio_set_config() as that call is
> currently not implemented in your corresponding .set_debounce()
> callback for the GPIO chip, but could easily be handled
> by calling back into the pinctrl back-end, right?
> 

Yes, it can be easily handled by calling back byt_pin_config_set. I will
look into what other options are often used and would make sense to be
exported in the gpio layer as well and come back with a more detailed
answer.

Thanks

