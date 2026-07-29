Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8633A48E9;
	Wed, 29 Jul 2026 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320464; cv=none; b=SaV3vVdg59gQd9/yuuMUfNUpXziwhxMh9F9ddiUpLf03r+tUb6yPRGQAIoDhkvwQONSm5HXx8MSnqKKqhQZiCi79oOMApi4NhKpOrfk6M3ICDnqtMn3snNFhHSNI2aO8qggCKG+grtd10xiPTOjVu0ewbhFRwswYQG9bmNc1fJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320464; c=relaxed/simple;
	bh=GaTewJc38KMp6dfgjCIkFjSwgwGHWTAeM19NXOdRW8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5I1wJAKMaZ0o8tS8jEArIgThNK4Vql5j7/PupfnGWkYiF2FsXs/h+wGzKN+QPjNP4MqRrD9U41YfD26eekV+aqcjE1UK6I1LH6Nv3DMvvjY6iIZUsE9ArV6fPIC4jiiUvnvyP83QirVrc9cbBkIKU0bBKiASmrFxyRw3iRmiVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tDXF5yt2; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tDXF5yt2"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7mX3j3634839;
	Wed, 29 Jul 2026 10:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QnJM0c
	MH1kdlqQSvzjzpXcXXJObSyr6QKLmI7nTkGS4=; b=tDXF5yt2hFjfygffcbDP/A
	sr7Zq7bXgW942xNPU3YmfWNvpEdkfdO9Ry5unTER05sJivkPESj3CYejH2i4fbQu
	lilSsgcrQ2sFig3KGV5l7X9+biRksoa3jGtv3yf4A13nThRa5cnZooXIDxJG6hep
	i812OBYCGe3k2LeXpuZ1aQ50ZolEcyKb3ZrU0X0U9kF1Arb98WvSfgXOOk7KH0ZB
	DezbzgwG39r1nqx/ONr6fRfjweCBkpzqOKNSGGv1N01Bk0QAK/Bd4P+BCuQd2aXj
	vO8aDehRHp93gTEwkqZCLBeN/1LuuGLxNV3ey8tFhr59zUxoavt41G/OoC/Ut4OQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuwd1cex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 10:20:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66T9uIwm001557;
	Wed, 29 Jul 2026 10:20:49 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fn9pge1kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 10:20:49 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66TAKnqa29819582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2026 10:20:49 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E551158053;
	Wed, 29 Jul 2026 10:20:48 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4D9C58043;
	Wed, 29 Jul 2026 10:20:44 +0000 (GMT)
Received: from [9.43.93.217] (unknown [9.43.93.217])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Jul 2026 10:20:44 +0000 (GMT)
Message-ID: <230cf7f0-600e-40e7-8056-6332c678e14c@linux.ibm.com>
Date: Wed, 29 Jul 2026 15:50:42 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] gpio: move ppc4xx driver to drivers/gpio and
 modernize
To: Rosen Penev <rosenp@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, chleroy@kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260602050131.856789-1-rosenp@gmail.com>
 <CAD++jLmk3jMFS0DD0GGTV9AWu-oHJAoxymcyOKQycVFqKCRnzA@mail.gmail.com>
 <CAKxU2N_LhgDj-+-gd0_N9gQOzCddq7dypYhayFQ_09zggpor6Q@mail.gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <CAKxU2N_LhgDj-+-gd0_N9gQOzCddq7dypYhayFQ_09zggpor6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: uOxseckhRM3RlKZqeT12U7LgdmKaLGQE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NSBTYWx0ZWRfXxmGqf1rwg8Mw
 Mi+da1igw/GY20DVPaVTbbY/H14yVxlga9tiN7PqM0Gyvcw586dM4bKHS/0/JMBpn4zQob0vUXa
 xaOEJPo7csB2FfV5l4g5dNJtVzG6tnU=
X-Authority-Analysis: v=2.4 cv=E/z9Y6dl c=1 sm=1 tr=0 ts=6a69d402 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=1qTmT2lI83L1obHQBGoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NSBTYWx0ZWRfX/sBoHrRcpWk7
 zcvaS2nrWpz1E7J9X9xJiUhhaoD0bTieM2L4PP3jiYL1vx+MGKQqnmuW6qIIl/FVB1zZr0IxQnl
 e0nMv7RM1dxPaKYvX6B0b5MKqmP4URNlA0AHA9X2dlKohnQJSiuSZ6L0wnrM6AKwWIVU6QNReB8
 cpl2Dye0UJU+WpND4cot71E++auBLbZVE6B9kIOnUOrE7IgIFBqEgvVbUEOFFpkB1WwkeoKvZpv
 +dSbZV98oYJba7rp/h/zr9ZqMfvoLDQMg2SC8BdNcFZ8uGlncZfndD3wv3owr14xUz0uZ+53W4S
 WX7iRD15URkbu5+W0lsxJab0shNZKiayDBsaJpUXhvnxDr2OQ/1xShp+AHHh1+xoWNPYW3Qj68e
 LWYv68exru/reIdVde2tNgTaptewzQ3rt/dp2eYaO9WvZgL+5+1nkLbrc1HCrISVZG7tXjPv0q4
 7TZ4wq8DARUDoOHAs3g==
X-Proofpoint-GUID: Q7c7bpOJo_XeF9oGSCMfGXRmpxEijuw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290085


On 6/9/26 3:50 AM, Rosen Penev wrote:
> On Mon, Jun 8, 2026 at 3:10 PM Linus Walleij <linusw@kernel.org> wrote:
>> Hi Rosen,
>>
>> On Tue, Jun 2, 2026 at 7:01 AM Rosen Penev <rosenp@gmail.com> wrote:
>>
>>> This series moves the ppc4xx GPIO driver from arch/powerpc to
>>> drivers/gpio, converts it to be a proper platform driver using
>>> generic MMIO helpers, drops architecture-specific accessors, and
>>> prepares it for module build and COMPILE_TEST.
>>>
>>> Patches 1-4 move the driver and convert it to standard platform
>>> driver infrastructure. Patch 5 switches to generic MMIO helpers.
>>> Patch 6 drops PPC-specific IO accessors and enables COMPILE_TEST.
>>> Patch 7 adds the missing MODULE metadata so the driver can actually
>>> be built as a module.
>>>
>>> Rosen Penev (7):
>>>    gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
>>>    gpio: ppc44x: Use module platform driver helper for GPIO
>>>    gpio: ppc44x: Set GPIO chip firmware node
>>>    gpio: ppc44x: Use platform resource helper for GPIO MMIO
>>>    gpio: ppc44x: Convert GPIO to generic MMIO
>>>    gpio: ppc44x: drop PPC-specific IO helpers and rename to ppc44x
>>>    gpio: ppc44x: add MODULE info
>> Overall a very nice patch series and happy to see that AI can
>> assist with this kind of refactoring!
>>
>> I guess we should provide some slack so someone from the PPC
>> camp can test it, and if they don't test it, then it is abandoned and
>> we should then just apply it anyway.
> Hmm? I have the hardware. It works fine.
Honestly I dont have the hardware to test this,
but thanks for the confirming, i will pull this for the next merge.

Maddy
>> The series:
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>>
>> Yours,
>> Linus Walleij
