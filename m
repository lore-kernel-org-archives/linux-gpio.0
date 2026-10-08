Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51AF47C10D
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450274; cv=none; b=QwvIti/4UQQyzOdVw3o/RcrX3g/hv5SHamTv4ohtJT1Th4WjRMxdW8EOME9FQ1qQ782Rqf0yqlrPwIUje9u0yzVbVrK1Ecc1dv6MnkR74eHgzQFqp9X89SaEtNSGWWCwiY9V7C9x/+kh8DqarkcSa8D3x1acp3Zi8I42lDWsXRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450274; c=relaxed/simple;
	bh=UITxWTPNyyI4Sr69UZtCDMKyyTgOTcLWLURy0ck0Z+c=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=L6hRAMYSVUR3poR08SiH+ido33QZqI7q8IzG/Exs38FclDcMdohGuNWrGz9daTJUxQ1cosuNY8z5qlTuq15fvSyVFUWY967P27zO2F6ASUNN/h7sIxp3VRGoMIinVC0i2uqlQgCkL0kQGCQQ/R8ZAwM6xi/qNZbry1IqdBU3TWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=VlSde2ZN; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="VlSde2ZN"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nZE5AyB6dfBQs8CS7mr3Fvb05uXEMPU3WMOtaMF71eU=;
	b=VlSde2ZNOTBpzEllPbG5HUJgfQJ8E0gJkCy6Trswx4G+wVthH2Cr0HWMXhaAjbjNfpc0NmCl5
	WQaLIr0pg9xJTdN/G4zcptmQnIgE93CTJ0vTlZUYZLbI12uJLhfc2xHybPSX7PbjD+tT7ghGklm
	T5L6SoBGVzKxEB6MRiiedp4=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4j0kJT0g8fzRhQs;
	Thu,  8 Oct 2026 16:52:09 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id E6B2740538;
	Thu,  8 Oct 2026 17:04:19 +0800 (CST)
Received: from [10.67.112.178] (10.67.112.178) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 8 Oct 2026 17:04:19 +0800
Message-ID: <6AC75C92.9090409@hisilicon.com>
Date: Thu, 8 Oct 2026 17:04:18 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Linus Walleij <linusw@kernel.org>, <longzhao@ambarella.com>, Chanho Min
	<chanho.min@lge.com>
CC: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Bartosz Golaszewski
	<brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>, Long Zhao <zl020895@163.com>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v8 10/18] gpio: pl061: convert register access to regmap
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-10-282ff5d98dda@ambarella.com> <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
In-Reply-To: <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200006.china.huawei.com (7.202.194.72)

Hi Linus and Andy,

On 2026/9/22 15:23, Linus Walleij wrote:
> On Mon, Sep 21, 2026 at 6:23 AM Long Zhao via B4 Relay
> <devnull+longzhao.ambarella.com@kernel.org> wrote:
> 
>> From: Long Zhao <longzhao@ambarella.com>
>>
>> Replace readb()/writeb() with a MMIO regmap while keeping the existing
>> gpio_chip and girq irqchip. Use a raw spinlock so irq_ack() can run
>> under the irq descriptor lock.
>>
>> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> 
> It would be good if some critical users of the PL061 could
> test this patch.
> 
> Wei, can you test this on HiSilicon?

Sorry for the late reply!
I did not get the HiKey boards these past days.
But I test the v9 patchset on the qemu sbsa-ref machine to verify the 
gpio powerdown and it works after resolved some trivial merge conflicts.

The detail could be found at below link:
https://github.com/hisilicon/kernel-dev/commits/topic-test-pl061/ 

Best Regards,
Wei

> 
> Chanho, can you test on LGE hardware?
> 
> but it looks good!
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij
> .
> 
