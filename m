Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB574CA797;
	Mon,  7 Sep 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787953; cv=none; b=cNOCtSY67jXtJWBk1GbiccCobfevN+E8eYwqgUCJZ1cVgFrQdTEQLoLgvMWxH1DHglOwy/PsE2zAAPxf+R2sKdfwFiDJM62wG7WT2ZZBc7O899lcHEHdqB9sqhLhmac6iynqpABG6HdcleLbuqGQN9nljonKd7CRneWj8V3HEtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787953; c=relaxed/simple;
	bh=VVw4k2oa1IX13m5I8l1jeY9GfX+eJrls5NCdzQjJZt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXFsRGbjBlGDlunT4Lch5fk1+zDidA/ST9s8Mlp5/X97bpUOUxQ4q5d5LWmLDp0iFFnHeop4mG9lliDJ9OefR5HL010VqDvmmbc6SgNtnmUwClW8pxR6qWiLeQu+699BL0bKXIGNNFuFJzZg22IQku4fujueRmUupCBF0Zjdt/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=I6ZIRVuW; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=wN0QeEMw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="I6ZIRVuW";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="wN0QeEMw"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788787939; bh=mWb+v9ELHieEJdI9V8la+OB
	UPpFF5NV2q9OjdTiSJRg=; b=I6ZIRVuWQTrHnmLYkzd0a2rXsx57mBERzFqNVyIR8/qE9hbIIu
	/wUXBGFjz62Ychb83zt7mLt0fGHgjSCCCj5VY6WK6dMaxYwZ1DJS3uV2/GpFZvzbH4RFlShSvsR
	T2QYFCVJk6aXnO65rLz8CKy3ONovyxOEk0zk56xwox9JmLQI1hIUJrbnwR3TSK23Ls5CVX1Kz0G
	CfD7zvNZz5ysB8vBpiSg4/S8ql7F3du4znpqH/gjHQV7Q7NfUfMXDdBsCpyQ4W+yEWMX4N632+5
	8q+A/R3vXTSEP4mGbgfQ2gyEoG5gK5kWqCa1gnK0jGuzqYrpS7FofToqpfwL4byhGsw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788787939; bh=mWb+v9ELHieEJdI9V8la+OB
	UPpFF5NV2q9OjdTiSJRg=; b=wN0QeEMwNYOv0lBrLNHEI+Z8DyN58jT5ql8slkTjedrB4jQgUt
	vSodLOREhskQ+Jbwy0BxVrg7BnCMPLozraCw==;
Message-ID: <f27df150-f21f-4721-9fbc-1bea7dd0f05e@mainlining.org>
Date: Mon, 7 Sep 2026 16:32:17 +0300
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
Content-Language: en-US
From: Muzaffer Kadir <muzafferkadir@mainlining.org>
In-Reply-To: <ef41a092-cd83-4e65-a16a-7a8b838bcb63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konrad,

On Mon, 7 Sep 2026 14:04:59 +0200, Konrad Dybcio wrote:
> On 04-Sep-26 14:55, Muzaffer Kadir via B4 Relay wrote:
> I told the robot to take a look again (and again and again
> a couple more times until it stopped complaining)..
> 
> The following feedback is meaningful:
> 
> Hi Muzaffer,
> 
>   `qdss_tracedata_b_groups` advertises GPIOs that cannot actually select
>   the function. Please populate the corresponding PINGROUP slots:
> 
>     GPIO8:  mux 11
>     GPIO9:  mux 12
>     GPIO12: mux 12
>     GPIO13: mux 12

I will add these to their pins by sending v5.

But also I want to ask,
does atest_combodac_to_gpio_native
have any mux on gpio12/13/20/21/29/30 ?Or are they wrongly set ?

> 
>   Minor nit: use MODULE_LICENSE("GPL") to match the nearby Qualcomm
>   pinctrl drivers. // and checkpatch will ask you to do the same

Some of the upstream pinctrl drivers were
using "GPL v2", so I wasn't sure about that.
I will change this to GPL in v5.
Thanks a lot for review.

Best regards,
Muzaffer Kadir
