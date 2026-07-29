Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D37472525;
	Wed, 29 Jul 2026 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322545; cv=none; b=egMc4iLg88RIlvFgbWWgA96wSgNgn9/Gyh6m5UC7LtZvlQ3OyALKdrdQHomQnR4TJvpherYGYbKy/7WjSrb4yRZ60CQWGxjui77iQJ/lbbvXW2njoiNnVMZk5rPdtYZ42QrEcLVnsaeWZ4bqAeavgCn3o8Frvkkd0isdkOeH6hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322545; c=relaxed/simple;
	bh=d37Ayru8kOKLs68umAgDz62Rv26fgWve9REj/zkDR5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PoH0ujkO3QhuibvEa/qV7UuWUXggojk65EO3CaAlUconQZd984d98x8o8UOj5S5mKTCLUnRA0QN1txuHZ1EfZ0hNaUGGtEFa96Zh1/WHpebRg7Za/fB5phkTrxL/rIIaHDXOJyqji11VRoRESKS+b8MLHMpdo3euYsEdVG/8TSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EIOqXW4e; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EIOqXW4e"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7mGKp3634526;
	Wed, 29 Jul 2026 10:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hwzzCr
	a7C0CstJYEp1tT42EDexaQnLy5hI/uUa94VJk=; b=EIOqXW4eOHkVlvGZVNb58M
	ba4wOfAkNZof2DISqhjKeWhRPvqIP09zfeo90onRdNVKQpjlzZsUo/ITZsQhI19y
	hflBv/chKJ/ff5NohsCEacF4pndlQ3OiO5k1oUx05p0CbRPUlgWDiZyr16CY3i2M
	ciQWBW2tSGsBDseaqcklR3H/JFxx0Kr8d35kdbwz3xDnV+8gHeHDWD7p7VFpmOEc
	maM/0np+RsL7T0jwO6SHOKCionyIzd7AFzOgztPml+NWeYjolhWYgGOiTEL0C4oe
	fSyAXKQzkqo2mAtuhvDJex7Ey7Ju8mFbT4GzP3tZ7TYF00oXnJp5I3YKc0+zLsYQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuwd1g5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 10:55:30 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66TAfIoj019204;
	Wed, 29 Jul 2026 10:55:29 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fn7fqegru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 10:55:29 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66TAtT4u31195844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2026 10:55:29 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15C745805D;
	Wed, 29 Jul 2026 10:55:29 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6858E58053;
	Wed, 29 Jul 2026 10:55:25 +0000 (GMT)
Received: from [9.43.93.217] (unknown [9.43.93.217])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Jul 2026 10:55:25 +0000 (GMT)
Message-ID: <7ee42722-f7f9-40cc-a576-5f85e3955537@linux.ibm.com>
Date: Wed, 29 Jul 2026 16:25:23 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpio: ppc44x: Convert GPIO to generic MMIO
To: Rosen Penev <rosenp@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: chleroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Linus Walleij <linusw@kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
References: <20260602050131.856789-1-rosenp@gmail.com>
 <20260602050131.856789-6-rosenp@gmail.com>
 <CAMRc=Me0rqs8nxrp95X-2Bjw059ahRxwKrg-NtmEt025w2m9bw@mail.gmail.com>
 <DIYGFNLIFBW7.21W9J6SUGYF72@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <DIYGFNLIFBW7.21W9J6SUGYF72@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: tBTYakU7n0Vn7e8QtzOkKWyfn88bok8S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX7tiGFQIxiNTD
 F5t8lwghZ87HUEg4HyT/mIeDMhZcBtEUHVJP99SevMzAhatguMlb2ABLDOlP9LoIJ9bF3qZxMjP
 bIkxl3HjwzcDIZ/WqJj/UroK3ci+qIY=
X-Authority-Analysis: v=2.4 cv=E/z9Y6dl c=1 sm=1 tr=0 ts=6a69dc22 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=z9-AJV4jkBIuID--pQ8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX4yNDahZHuPoE
 NOrFq1T9oGQXP92vCYPR9wX4LBtge7vujkpR9dSj/7CsWvLffWZwzU0wihkfXfo831jmIBsvntg
 uRvg3hLSG1YEghUhQcIdUbX+ycki3SrbdhLNvOEAoEEycCTJg3I6Mq5J4y7nt7N2dvdzhnAqgjZ
 BRzgkou2UWBXoCja5phIJJsbrup57tUi3mUGHtN6O9EqWn16qX2/v6hpa/hmocKvC+4f+YZT2DK
 vRArgzWC9cUTvehvuLHd+y2tbtrsWfs31iTn/pA34KCC/YUDKvWb5U94Mu/g8hrSkIjfqVk3Moe
 VaQ9Cwz1E6W4JTEbjPINxTi1pKe5y8wkRayYJAIhK5UYQ0v3LiQsisYdYyUpOk8LSzIiLCiRvUq
 vWcjxqTRyj2+879binTZNrQNAiI5rNKzFwhksBSpwR3+1DgMW9sg4Ux5q33DmrVt+ylrzEcurph
 Bel8dKfXC8OqWcxunAA==
X-Proofpoint-GUID: FNUgsNz_MsXy1ihe6T69R8zQNpiNvb2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290089


On 6/2/26 2:56 PM, Rosen Penev wrote:
> On Tue Jun 2, 2026 at 12:51 AM PDT, Bartosz Golaszewski wrote:
>> On Tue, 2 Jun 2026 07:01:29 +0200, Rosen Penev <rosenp@gmail.com> said:
>>> Use gpio_generic_chip_init() to set up the PPC44x GPIO chip
>>> instead of open-coding the basic get, set, locking and state handling.
>>>
>>> Keep the PPC44x-specific direction callbacks because they still need to
>>> program ODR and the OSR/TSR registers around the generic data and
>>> direction registers.
>>>
>>> Assisted-by: Codex:GPT-5.5
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>> ...
>>
>>> @@ -124,10 +102,11 @@ static int
>>>   ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>>>   {
>>>   	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
>>> +	struct gpio_generic_chip *gen_gc = &chip->chip;
>>>   	struct ppc4xx_gpio __iomem *regs = chip->regs;
>>>   	unsigned long flags;
>>>
>>> -	spin_lock_irqsave(&chip->lock, flags);
>>> +	gpio_generic_chip_lock_irqsave(gen_gc, flags);
>> If you're already doing it, can you use lock guards too?
> Sure. btw, I avoided placing

Do you have plan to address this comment in v2

Maddy
>
> https://lore.kernel.org/all/20260517063754.21819-1-rosenp@gmail.com/
>
> in the beginning of the series. My thinking is that's for older kernels.
> I believe either the generic API or devm_gpiochip_add_data fixes this.
>> Bart
>
