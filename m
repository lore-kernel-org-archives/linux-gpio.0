Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CB9375AAB;
	Mon,  7 Sep 2026 14:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790779; cv=none; b=dsd+TJYrdyD/4FJqO5kA5ZnZEF3IoyMY/FDzEmeCZyjeQwgeGsB8+mJWPWsJne7ZIQgWOwltRHzOxmZLT2oZrgd0bHHZKMOB99z5jRjVoyTZcaYD4FKlhgmY/VKOG8dwNdy0AgRX5toTqiCF/bKyjtE7FpcXi5YR/l1TwvqL8V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790779; c=relaxed/simple;
	bh=AfG6dl5CO1tCDNo73hjdFZRXfwvyrFUC/ndrbYV88/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZ31JqfPkSlda4JdKPyaJ72HJ7MLM86GFdjbQnN06U4X6pySiFQbtOR7qafB3hbsUZY73e8/lZ3MahPTGVD+Oh09U/5JfYeifnetjEPXg703eTx9BmugzXTszpq4ZA3eefLWOrbOXNoBFgVZcrravsDmW4GXi0EZnHa22snFU+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=EkVMMPEE; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=//xomaoR; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="EkVMMPEE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="//xomaoR"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788790768; bh=iDBuazo/hF1xMCAFJmJDaJ8
	/uPmeTvKfQ3l9p87VERY=; b=EkVMMPEEHXY6CMmoM6zl4BRREtHWyOXe++S7lKSl10TkGiHYG1
	JENYSc5rj/mVzTIiS61aGN5Cf8PigPs+rGlQ71cS3OWetaiiPo0HwJpwLu+YnsNcVvNiSWfILSo
	6Jmku8IzK9rcEsUOyyp3PLSLf40yn71udBsB3s9T1C7eyUA7wblHlCsuLrrXH1GlXwxeabc5SDF
	rxo7mYRDcqCH6ITH9apxG9GHSMqQD7awKTEpkdEHLwtkWElJUsEKPA6fMJ6JRzJJomYYgNrjNhC
	6w2o6SG8PKqilofaMdF2iDzbed87M9A6h2IW3wg9oLUEwRcSVrJdCtCR8PgxU+dtEqw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788790768; bh=iDBuazo/hF1xMCAFJmJDaJ8
	/uPmeTvKfQ3l9p87VERY=; b=//xomaoRMZFwn8+xGL7dmWlJNTKCZ+L9uTHaikhfUwYITkMT4L
	DM0kI95ivi/6uVk4vUuc+9W32ByEew3gyZBA==;
Message-ID: <c8f9e9c9-d619-4094-8968-c162d6b2b361@mainlining.org>
Date: Mon, 7 Sep 2026 17:19:26 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
 <ef41a092-cd83-4e65-a16a-7a8b838bcb63@oss.qualcomm.com>
 <f27df150-f21f-4721-9fbc-1bea7dd0f05e@mainlining.org>
 <d1ec9149-7034-4002-beaf-d389f0603fc3@oss.qualcomm.com>
From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Content-Language: en-US
In-Reply-To: <d1ec9149-7034-4002-beaf-d389f0603fc3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, 7 Sep 2026 15:39:18 +0200, Konrad Dybcio wrote:
> On 9/7/26 3:32 PM, Muzaffer Kadir wrote:
>> Hi Konrad,
>>
>> On Mon, 7 Sep 2026 14:04:59 +0200, Konrad Dybcio wrote:
>>> On 04-Sep-26 14:55, Muzaffer Kadir via B4 Relay wrote:
>>> I told the robot to take a look again (and again and again
>>> a couple more times until it stopped complaining)..
>>>
>>> The following feedback is meaningful:
>>>
>>> Hi Muzaffer,
>>>
>>>   `qdss_tracedata_b_groups` advertises GPIOs that cannot actually select
>>>   the function. Please populate the corresponding PINGROUP slots:
>>>
>>>     GPIO8:  mux 11
>>>     GPIO9:  mux 12
>>>     GPIO12: mux 12
>>>     GPIO13: mux 12
>>
>> I will add these to their pins by sending v5.
>>
>> But also I want to ask,
>> does atest_combodac_to_gpio_native
>> have any mux on gpio12/13/20/21/29/30 ?Or are they wrongly set ?
> 
> Yes they do, the robot pointed that out too but I figured it pulled it
> from the internal data and not from the existing driver. They don't
> really have much of a use outside validation testing I believe, but
> since they're there already:
> 
> pin	func_idx
> 12	14
> 13	14
> 20	11
> 21	11
> 29	10
> 30	11

Hi Konrad,
I noticed that I forgot to say pin 41 (Sorry about that).
Could you provide it too?

Also can I add mpm pins as a seperate commit in v5?
Or should I wait until adding mpm to msm8952 device tree?

Thanks again.

Best regards,
Muzaffer Kadir
