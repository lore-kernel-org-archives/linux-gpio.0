Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683529;
	b=yR7laLIm8VbLQvKsSeZN9xAzdRQbVs3MoKe/4jx+tJUPzZbnyfukMm1npr73cBwy4904
	 YkXLloIhqGjfXcYD+zIUscDeNq4sdPlYXAZBEwKMC9pKbHJKOBdcal1aqU4+946rmRzqi
	 37zOQCociNPv7y4AGNeO+8BKfvOYsncgXiWBlO/PKDHphLpv3aavKGBeZiC1iFPkWO4DN
	 DouEk+qa3YjMuSbkkVMnvZaetqyAtHrm7/LCO6bWUEI5J7jeIi6AsIVX0lZzqX0SYZWin
	 psKGvHOI/F17hxgkUpMXG216EEg/zeU9yOj/hP5vwTlMjdt8Tk06lh3w5FfVMNCDJcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683529;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YabsYvNcN7NRudE3X2qygK4jhCTbAWijGXAt+Ry/b3g=;
	b=dHP7Au14DmltbspiTPPW8LjY+/GWv0Nnum4zyhjY0eajnS5swMjfbWOldS/Jd2TEjH0c
	 +gEifq+AUdX8ya5QxHdGgQkHRlzFGb3b/Jar2Gf4e89Ft2UbASobDyrPxH7AA1Jd1PFOh
	 One6sQZPo53SF12HVs3tJQrhoB3lCW+3y7cAVzEiRihKW985qqu1QschtZQ3hcG9/dvNS
	 TM1TAHsRuj3A3Q/oLfqauOpesUhLSywreMox1s36gOPfYGvW1G3+ntl/O4eb6DhZagQSe
	 xGb9XLOMSCkyVsXTZpPp1KZ+J3No2biPDacyYhJ82HaugQtgWAboO1HLgmFCVwwHrUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC38C606A31E;
	Thu, 26 Nov 2026 08:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC38C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:56fc:14c:5747:737e:5903]
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xWVJS-008XUU-1k;
	Thu, 26 Nov 2026 09:58:42 +0100
Message-ID: <72924d48-0fc6-4c80-a5c4-4f16362b0179@phrozen.org>
Date: Thu, 26 Nov 2026 09:58:41 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] pinctrl: airoha: add AN7589 support
To: Linus Walleij <linusw@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Ahmed Naseef <naseefkm@gmail.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 lei.dong@airoha.com, Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
 zhengping.zhang@airoha.com
References: <20261124094059.3882014-1-john@phrozen.org>
 <CAD++jLm7b_Q8aN5E7zjEU8CPknKYy0ui_LE+jPYJji-YzAWxJw@mail.gmail.com>
Content-Language: en-GB
From: John Crispin <john@phrozen.org>
In-Reply-To: <CAD++jLm7b_Q8aN5E7zjEU8CPknKYy0ui_LE+jPYJji-YzAWxJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25.11.26 19:28, Linus Walleij wrote:
> On Tue, Nov 24, 2026 at 10:41 AM John Crispin <john@phrozen.org> wrote:
> 
>> Patch 5 adds the IOMUX to the syscon compatibles. Patch 6 adds the
>> binding for the pin controller. Patch 7 adds the binding for the GPIO
>> system controller it sits under, which also holds the PWM controller.
>> Patch 8 moves the GPIO register offsets to the common header, so the
>> AN7589 data can describe its own register table, with no functional
>> change. Patch 9 adds the AN7589 pin data.
> (...)
>> - Split the bindings in three: the syscon compatible (patch 5), the
>>   pin controller (patch 6) and the GPIO system controller (patch 7)
>>   (Lee, Conor).
> 
> Once Lee merges patch 5 with the syscon bindings I can merge
> the rest to the pinctrl tree.
> 
> Yours,
> Linus Walleij


Thank you !
