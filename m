Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D73DFC61;
	Thu, 25 Jun 2026 12:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.250.0.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389145; cv=none; b=QEhGzL/FrnA3krsehLS/9EGWMw1hoda5RnL2V4gV+SV/BgGhMponA10PUP29+py5mFv6EY3RDND4plHWLESlPkX5gAudlOlVbYs8jNaQz2w05eeQ7sCoyNT1e4EFxChEvPxNtn+m//oyXDBUok8Ga6C4mHqnDAn7ZXbsI1gJHpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389145; c=relaxed/simple;
	bh=FxD5JjqjW1gaKhHe+/B9VFLUNkdIT1Gd3a5pW/Cr4Y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDb4VdAA1cegfyzSuHl1i3PJ3id0OCWZQSZkdT0zGzKpTK1RNweLdirC8JU4+3PaE8owSAqG9yxe0mc9zOieUYfG7iCF0vGKC5ynJ7Hwnn3Dh4KpmFPLFfC8IsQQNOxv8jcrhs1nE7G3PVFgJRAWPxN0/ah7OAMCNMtDzeUmzv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=iHUltsGX reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baodeep.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b="iHUltsGX"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EF0D1A0C8A;
	Thu, 25 Jun 2026 15:05:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782389141; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=9mXIj+mN0okDzD2iEIEK87JUucdAnGmmd68jsRDhCyI=;
	b=iHUltsGXX/Iok1BcHLC8NxNAXZxiLB+f7d3VPaStvR6pB8Z9s3jDvPszknOwZwAJFsv/SJ
	HFGmAa/Kypg57bgHOa4XwhwnZZie1Y9j7TsMAt0cP6PC+1G5EhxOZXsZQyqI0OFkbOGkUx
	neQ857sOVo4ggIOzoT4h668BIdiHwrcauN7lTfDDXkbC8eGDCwCXGoEbk6z0f/1YjPO5zK
	6zvUs+KbcYqJgZ9X9Rs9T+ThfEwVkeWwZ61fZDSBTVsVzBWALbKYy0KUeRaqCaZW5nvQzm
	enUSEkzFyHe6r9+KCLS9ZHFgOYc6J0tepzgcTtxA9WkCJGejnRM4jfSZel/PVA==
Message-ID: <49c2aeb0-39b9-4bbe-833e-b18e38167f8e@baodeep.com>
Date: Thu, 25 Jun 2026 15:05:41 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <CGME20260610153425eucas1p29d20a835114a28b15cb12ea00534e074@eucas1p2.samsung.com>
 <20260610153329.937833-1-v@baodeep.com>
 <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
 <112d2563-e650-4881-bba0-335f6a3fcb8a@arm.com>
 <CAMRc=MdP8Wf6QRXGHpb3KJW2KMidSe-0LeyKKTYix=wYKZcPuA@mail.gmail.com>
Content-Language: ru
From: Viacheslav <v@baodeep.com>
In-Reply-To: <CAMRc=MdP8Wf6QRXGHpb3KJW2KMidSe-0LeyKKTYix=wYKZcPuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi!

24.06.2026 10:25, Bartosz Golaszewski wrote:
> On Tue, 23 Jun 2026 17:16:44 +0200, Robin Murphy <robin.murphy@arm.com> said:
>> On 11/06/2026 9:26 am, Marek Szyprowski wrote:
>>> Hi Viachesla,
>>>
>>> On 10.06.2026 17:32, Viacheslav Bocharov wrote:
>>>> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
>>>> the underlying chip's can_sleep, but under that lock it calls config and
>>>> direction ops that reach sleeping pinctrl paths. On a controller with
>>>> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
>>>> runs from atomic context:
>>>>
> 
> ...
> 
>>>
>>> I've checked this patchset with these two reverted and no warning was reported.
>>
>> If it hadn't already been fixed (...)
>>
> 
> About that - Viacheslav, do you still plan to submit v2 of this?

Thanks for review. I prepared and sent the second version of the patch today

> 
> Bart
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

