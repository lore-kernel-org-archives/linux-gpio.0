Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3808C2F39C7;
	Thu, 30 Jul 2026 05:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785390543; cv=none; b=FHzYcCSc8pfCBRWVljPF2vk8IlJshH5JQlS6AGh50Q1w8MdzgdTxlX6T+yUFx19sKJjInGZuWuf6Ps6JDFjsROoXlnA7j9fUw+FexcwArE9NUuZpLFMz9iV7KXUviWIRaae9+fJW13tTn3Mf2KKSe+vyKVc6uYf4j4LpsyON8Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785390543; c=relaxed/simple;
	bh=x8uDvBHOCzKxTB5vsNzbMk0C3eFUXtNbJMu8x4CJyJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpHWZY4aYyjzx9kJOQF1QiA2H2Ip1y3/4OgTd2R/aJevK+3sTaEkhHaWPE1R8R6ZcISdplBS3nGxPhj6Fg8esdOctpq9KpcW37zlgWyZDp3/N8LtWqDm4DtwZFuQu2+ZuOODvupNWhs05JfLw70Mk1CRO3epc7gQC2564B9kxss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1jCs3Wk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1jCs3Wk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAA71F000E9;
	Thu, 30 Jul 2026 05:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785390541;
	bh=m6Whuwkaw0RMATD5xLRXxrJWIUNWAR2RTwUf7nBvDK0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=R1jCs3WkxZakz7d2DfJ2xUgxDINXMa99cqAADObqGxUlDCecDoeEKImz+v/VF5TQ7
	 iUM3rZamNOPDQk83PlEvny/EH1zgX+p9KgL9cJpWOE2g1iXL0hMFtRLtYvCfCUIrd2
	 NCSJW1NiDxQMq0JV2LIbAg3o72DMTxkyF2mUPfldaZJqMDUnGzx3tuFvNcc8FaO59x
	 nYQg4AZJKgsGCFMwYNB+jC4rwUaTaVFj2s+8fSsSPorJ0ocSffk4178hshTo36TFS2
	 +D4YVpJGu70IhPkZZgekucuUq4PRsOFkqOJeDJIvwCChLkuPwqAN7yGefxL3EE2e1F
	 zUjV6D4ZVC3lQ==
Message-ID: <880aae3c-a552-4d3f-8ed1-e3dc3911ee1a@kernel.org>
Date: Thu, 30 Jul 2026 07:48:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpio: ppc44x: Convert GPIO to generic MMIO
To: Rosen Penev <rosenp@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org
References: <20260602050131.856789-1-rosenp@gmail.com>
 <20260602050131.856789-6-rosenp@gmail.com>
 <CAMRc=Me0rqs8nxrp95X-2Bjw059ahRxwKrg-NtmEt025w2m9bw@mail.gmail.com>
 <DIYGFNLIFBW7.21W9J6SUGYF72@gmail.com>
 <7ee42722-f7f9-40cc-a576-5f85e3955537@linux.ibm.com>
 <CAKxU2N8n4iHrr-+NxL6D9WZ4EgH_XVJ7yfPa4P6ZyFNJTir60w@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAKxU2N8n4iHrr-+NxL6D9WZ4EgH_XVJ7yfPa4P6ZyFNJTir60w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 29/07/2026 à 20:32, Rosen Penev a écrit :
> On Wed, Jul 29, 2026 at 3:55 AM Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
>>
>>
>> On 6/2/26 2:56 PM, Rosen Penev wrote:
>>> On Tue Jun 2, 2026 at 12:51 AM PDT, Bartosz Golaszewski wrote:
>>>> On Tue, 2 Jun 2026 07:01:29 +0200, Rosen Penev <rosenp@gmail.com> said:
>>>>> Use gpio_generic_chip_init() to set up the PPC44x GPIO chip
>>>>> instead of open-coding the basic get, set, locking and state handling.
>>>>>
>>>>> Keep the PPC44x-specific direction callbacks because they still need to
>>>>> program ODR and the OSR/TSR registers around the generic data and
>>>>> direction registers.
>>>>>
>>>>> Assisted-by: Codex:GPT-5.5
>>>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>>>> ---
>>>> ...
>>>>
>>>>> @@ -124,10 +102,11 @@ static int
>>>>>    ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>>>>>    {
>>>>>      struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
>>>>> +   struct gpio_generic_chip *gen_gc = &chip->chip;
>>>>>      struct ppc4xx_gpio __iomem *regs = chip->regs;
>>>>>      unsigned long flags;
>>>>>
>>>>> -   spin_lock_irqsave(&chip->lock, flags);
>>>>> +   gpio_generic_chip_lock_irqsave(gen_gc, flags);
>>>> If you're already doing it, can you use lock guards too?
>>> Sure. btw, I avoided placing
>>
>> Do you have plan to address this comment in v2
> Yeah I have it fixed locally.

You should probably put patch 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20260517063754.21819-1-rosenp@gmail.com/ 
as first patch in this series in order to enable applying the fix to 
6.18 without applying the entire series and to avoid any future conflict.

Christophe


> 
> I'm not sure if this has to do through the PPC or GPIO tree.
>>
>> Maddy
>>>
>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20260517063754.21819-1-rosenp%40gmail.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C2ac0ec525c7045cd969508deed9fc7e0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639209467691381845%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iqGebSy%2BbKMBFZz%2FZwZ9N2Jf8v63FkGPNhrdUf864fE%3D&reserved=0
>>>
>>> in the beginning of the series. My thinking is that's for older kernels.
>>> I believe either the generic API or devm_gpiochip_add_data fixes this.
>>>> Bart
>>>

