From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: Re: [PATCH v4 3/6] pinctrl: baytrail: Update gpio chip operations
Date: Tue, 5 Apr 2016 12:23:03 +0300
Message-ID: <570383F7.1050906@intel.com>
References: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
 <1459508407-22011-4-git-send-email-cristina.ciocan@intel.com>
 <CACRpkdbyGZbzX6k2b6CSKFZmxShXQ0i1=efgX6EKAnCG1EibOg@mail.gmail.com>
 <20160405084823.GG1727@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:40965 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757658AbcDEJTj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 05:19:39 -0400
In-Reply-To: <20160405084823.GG1727@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Irina Tirdea <irina.tirdea@intel.com>, Octavian Purdila <octavian.purdila@intel.com>

On 05.04.2016 11:48, Mika Westerberg wrote:
> On Mon, Apr 04, 2016 at 04:08:47PM +0200, Linus Walleij wrote:
>> On Fri, Apr 1, 2016 at 1:00 PM, Cristina Ciocan
>> <cristina.ciocan@intel.com> wrote:
>>
>>> This patch updates the gpio chip implementation in order to interact with
>>> the pin control model: the chip contains reference to SOC data and
>>> pin/group/community information is retrieved through the SOC reference.
>>>
>>> Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>
>>
>> Patch applied with Mika's ACK.
> 
> Thanks!
> 
>> Cristina & Mika, can you provide feedback on a patch I sent last week:
>> http://marc.info/?l=linux-gpio&m=145864063724362&w=2
>>
>> This makes it possible for a GPIO driver to use native
>> open drain if the hardware supports this instead of relying
>> on switching the pin to input and thus expecting high impedance.
> 
> Looks like a good idea to me. Recent Intel hardware (Skylake, Broxton)
> is capable of taking advantage of this. Not sure if Baytrail supports
> this at hardware level, though.

Based solely on the official documentation, Baytrail does not seem to
support this, but the issue is that there are plenty of bits marked as
reserved in the conf0 register. From what I have seen from the initial
GPIO driver implementation, bit 31 from conf0 register can be used for
reading open drain (not setting, since it is RO). This information is in
byt_gpio_dbg_show. Since all the reserved bits are RO, it seems that
setting open drain is not a possibility for Baytrail.

> 
>> With a backing pin control driver I think that maybe we need
>> a pin control back-end performing things like this on behalf
>> of the GPIO driver, something like
>> pinctrl_gpio_set_config(unsigned gpio, enum pin_config_param param,
>> u16 argument);
>>
>> So the pin controller can perform config on behalf of the
>> GPIO driver (e.g. setting a backing pin to open drain).
>>
>> Do you think we will need this?
> 
> If I understand this right, GPIO part of the pinctrl driver just calls
> pinctrl_gpio_set_config() with correct parameters in its
> ->set_single_ended() to get the pin to the right mode. So yes, I think
> we could use it, at least from Intel pinctrl/GPIO drivers perspective :)
> 

