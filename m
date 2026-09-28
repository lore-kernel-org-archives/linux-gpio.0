Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D924E06C3;
	Mon, 28 Sep 2026 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605999; cv=none; b=ukCDLkXaVEyUhERmdDshQolzRkfTf/QujNnSKFKbQrzkT0in8Cw+1nhn8um08Uiih16KFuUt0ibHuJHYEb7b/caGn8Y/bibZDE4XNfAKT5smaAKZ1Q/Q4rKSjythDMVxgNFnwZ8OmjQcyidmqMk5/p5fS03dx5xJO8mo1CNaAoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605999; c=relaxed/simple;
	bh=FMkYD15CBXJtYpgLXd2y9axyzzA+/0R0ykk+aV6DwcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXzc2iAvwAjlzjVwAXPH3V6m5MXr2iaqY1llUQu2o49TS+8Cz6gvV1RhlkUd+uFoIn2FkOaEEVhhYJXHLfDfltF5QLKgHZ8Hv/uheA8kBLHHd0I4bSN9G/DCl0NsH2uOBoqfec+HgjrXvIgapggx1O23Z+tyuOf1kT05AJbT9iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3BB95hu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3BB95hu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D531F000FF;
	Mon, 28 Sep 2026 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790605989;
	bh=TmVDWZ+rpFUZvDnymCcQAVH5Y9H8d63D1FeSmyXnNfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=K3BB95huAo3BfhB10StSAVTC7z3XhZK0/qTOmUBcckJePN5FxuVazf8RS4WSXdR32
	 VEzQqD1KqM9Rzo0Az+DBePmOayvuIfrg9TiBQiPRG6QjB8tkmnd8TubcMYqiFGgW0t
	 WibX5qHKW54bsDePtHosZjTmIlDypEfceQ+URnwy5VgIsGfh1hiXiqFZd33Skz2BmL
	 tm6m0mqaAlHZFczEZzezk73UNaCnM6jGnM9OWBewWRwPkK4pv0XMqYk+KTgb2ZVDAp
	 Kcmd4t7fwoKJYOMlBtp5RB8Z/OUh7EpTwfnb9Jz9jU4zfCGYAETwyR7TeKX84hnoou
	 DuJKcZfDiFZ6Q==
Message-ID: <1f67ba08-ddf3-4632-a50a-6aa9c29ca1b8@kernel.org>
Date: Mon, 28 Sep 2026 16:33:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Bartosz Golaszewski <brgl@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
 Mika Westerberg <westeri@kernel.org>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local>
 <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local>
 <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <CAMRc=McKAR7VadTYtTfU1kAHSRidj_AdhBbDh+2zNpFWhjA2mw@mail.gmail.com>
 <CAHp75VdGwVf2pCXzmQoY5zvgSf0KsRH8hU9Qt45iZmEG0KMzCA@mail.gmail.com>
 <CAMRc=Me_sAdbqLq6s9sQ+Ti2_CfE8uHbAVqhe=PPpu8kPGkn9g@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAMRc=Me_sAdbqLq6s9sQ+Ti2_CfE8uHbAVqhe=PPpu8kPGkn9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 28-Sep-26 16:13, Bartosz Golaszewski wrote:
> On Mon, 28 Sep 2026 15:12:18 +0200, Andy Shevchenko
> <andy.shevchenko@gmail.com> said:
>> On Mon, Sep 28, 2026 at 3:25 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
>>> On Mon, 28 Sep 2026 13:34:44 +0200, Andy Shevchenko
>>> <andy.shevchenko@gmail.com> said:
>>>> On Mon, Sep 28, 2026 at 2:13 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
>>>>> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
>>>>> <mika.westerberg@linux.intel.com> said:
>>>>>> On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
>>>>>>> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
>>>>>>>> On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
>>>>>>>>> On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:
>>
>> ...
>>
>>>>>>>>>>  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
>>>>>>>>>>  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
>>>>>>>>>
>>>>>>>>> These are interesting drivers, not sure where to put them
>>>>>>>>
>>>>>>>> IMHO they should be there too. We are maintaining them both.
>>>>>>>
>>>>>>> Do you send PRs to Bart or you just rely on him to take the patches?
>>>>>>
>>>>>> I don't expect these two drives to get too much attention, and they could
>>>>>> be contained nicely inside intel folder and that would help Bart to
>>>>>> identify that these are Intel drivers. So your bandwidth would not suffer
>>>>>> even if these two are added there. Your call.
>>>>>
>>>>> I'd like to avoid a situation where we have Andy's Intel drivers under
>>>>> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd prefer
>>>>> to move all of intel GPIO drivers into drivers/gpio/intel/ and have Andy
>>>>> gather changes to them if he agrees.
>>>>
>>>> Okay, we have two parts missing:
>>>> - Nova Lake driver (I would need Adam or Mika to step in as at least a
>>>> designated reviewer for that)
>>>
>>> Acked.
>>>
>>>> - USB IO (I think we need to agree which tree it will go through, my
>>>> bet that media tree is the best), for that we need Hans' consent
>>>
>>> So far the initial commit was picked up by Greg and the other two were
>>> signed-off by me with Acks from intel people.
>>>
>>> I'd do the same thing as for nova lake: Israel, Hans and Sakari as reviewers
>>> and you queue the changes?
>>
>> I'm fine with this route as well. Since Hans replied, this all depends
>> on Sakari's answer.
> 
> Does this include moving this driver under drivers/media/ as well?

It is a driver for the GPIO function of a USB MFD (auxiliary bus) device,
so drivers/gpio seems like the right place to me ?

Regards,

Hans


