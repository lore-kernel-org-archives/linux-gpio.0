From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs
 dynamically
Date: Thu, 5 Oct 2017 11:59:46 +0100
Message-ID: <cc95d9b3-f18d-febc-0a51-cc3846d0de85@arm.com>
References: <20170721164900.7070-1-grygorii.strashko@ti.com>
 <CACRpkdbFVV669PxGDXO9Xzf-jj0sEKyQTvhdLMA_of16wBp7PQ@mail.gmail.com>
 <1501574614.2759.9.camel@baylibre.com>
 <835101ba-e5d5-fd5e-e0c2-06001d02f850@ti.com>
 <1505463960.16701.37.camel@baylibre.com>
 <CACRpkdZAJ1c6VyHA+2P6P4GaMY51q-ANc2NLF_2o4atzz2mqrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:43176 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751641AbdJEK7t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Oct 2017 06:59:49 -0400
In-Reply-To: <CACRpkdZAJ1c6VyHA+2P6P4GaMY51q-ANc2NLF_2o4atzz2mqrg@mail.gmail.com>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 21/09/17 12:41, Linus Walleij wrote:
> On Fri, Sep 15, 2017 at 10:26 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> 
>> I initially planned to do some refcounting in the gpio layer but that would make
>> no sense, as you pointed out, the irq could be shared. This refcounting would
>> only make sense at the irq level.
>>
>> On a more general note, I wonder when is it safe for a driver to dispose of the
>> mapping of a possibly shared irq ? There is no way to know if the mapping is
>> still used somewhere else, or am I missing something again ?
> 
> I have no idea, but maybe Marc Z or Rob H knows this?
> 
> They usually have a bit of deeper IRQ-centric knowledge.
Unfortunately, there is no such thing. I contemplated tracking this at
some point, and got sidetracked. In general, the irq domain and irq core
are horribly disconnected, leading to that exact line of questioning.

	M.
-- 
Jazz is not dead. It just smells funny...
