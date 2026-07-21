Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A0746DFF0
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2026 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650775; cv=none; b=TNhuaKUWR+2mB8eEx1EbbLemvLI2SMvXTMyU6H0sep5HqZToBpQfDFpIHLJBAG7j3WWgADx3xEoF5Wx/O1WqniLRrATWKD/Wv/1Lv3Zoxpvo3oNGuzHei2olm1yuKe5zLVT1awil/SQkETFcOoC5DKHeVQf/RGils25oVQaBBCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650775; c=relaxed/simple;
	bh=GD63EepOL1WUVqIWbQ/pkPgIFcUhv0ajMSyu8YwE7gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpLHpFtfaFW+xcogXjplU5v63iw/CqSjxK+ErqD6EqqLaXAcDb+Oy3/puXFSNK3qcMM0VKYdOb7r5esgodJlmwv39ew5acwtCnxhxiqt5DDE611AVHSeLYvkjWuIL0byuxD7feB7MHNK8J/ix1R9NnzMyWYi0sQ/vHFxmNPY7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvvHRGoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBWqntUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvvHRGoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBWqntUY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg7A01958776
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2026 16:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dTV6MHViCvNQyXCxsNNT5/4KQPDVAbuTpKtQfF4tMJ0=; b=DvvHRGoLDn4/ZEUY
	cm/d2ANvj3Ft4nNNFwuJSRO8WjuRUUCCMEFP9scVMvKffLEtQZQVfg3uEERJiQW8
	FoI0xuJSAuk0LBUSQlIaH+qFJmqf3EcfgvAkZClXoqVitdy3PjD+4jmuap7O5e/7
	Ul64BFk1MY4W8597sS7Rp5/Z3eXX0P2SE7c68upSk60ZfIdVjBlXLwfhvzgYEN1/
	Iy18V5f6P73FgXA6FfaLbE7ulT2i9iXuwr3o/JES+c++v8kdTwGN+Jdhqj0i8O1D
	h/AyAu+PzIG/uZzdUv6f2mBhG2McC4bxSb2LIJqCG0cP4yMRuBo5SHLmnhKxkNlx
	CQZGKA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvufy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2026 16:19:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso6756486a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2026 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784650771; x=1785255571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTV6MHViCvNQyXCxsNNT5/4KQPDVAbuTpKtQfF4tMJ0=;
        b=TBWqntUYIqiLic0nsIF6vguhkFPZ+DVsMXy2E84glt4WMSp+jzJGoKKO4eWbAg3gr4
         p3Z8rWJs9RRU4goexBBGIelEgQaWV0T1bZGc+EerT/3KhU9yXuqOKf99yDBB4Sg4xP7m
         icjOuCHwvs/lCBdu3qJjjNh0ca24dRfg3quQ2YY8BH22TQFmUGIvVVY60sHeND6GtAqd
         BqqVzc3BBrRw1kRHnlfbcE0YYOw1U+pzZMgrlOw+m6l9QGvQxlcXFzxAOC6CrsdEzD/R
         /V7Ew8M8HaXnfZyq9mY/wPaP8AG5UxkY7o9UZ//v+82yT6HilPsvlLJA+01JEWnrBOCs
         bt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650771; x=1785255571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTV6MHViCvNQyXCxsNNT5/4KQPDVAbuTpKtQfF4tMJ0=;
        b=YIIRxXcryvjgq+AgkliLmpdf/EHF6xQNroiIxftlEdPdLo9vQrAOZhWW/Gfz/4rA+Y
         PpETD8+TGqR1pjAFSOojiiK5sjDK41BHx8aGpLJo5YoPIHkwMdssXA9UPWWBA5Qn8HDP
         DZI+jmu3vblwhv3xooqnqEhv9XORDl5OHqLqa4rO2mKiSAoVB1yhvSPLqGQ5zlRdFOpB
         sDpz6WZLaJwot6PwPwiTotgcVw70UY9OC/8GPYRs1gEorcaTbzhkt21lyvpUzhMCfFnM
         QbuFpY0sH0k8NIFkWJSbkeQvXiwdVtFOyvYFbKNU2zqyA1V1m7lHgqiHTMMBBxvYtYWQ
         tXwA==
X-Forwarded-Encrypted: i=1; AHgh+RqqGCHVqeoyuvNMW6edNr0x8G5FoV6yKEFq3quJ2j7wAqpUVZqLXKc+zC5SaniZjaXJ4LAVmPTb7A6b@vger.kernel.org
X-Gm-Message-State: AOJu0YwCtAJUNpDIhJtZdm1V3NGWz6OyKbKwG/eo79zRZo4D+zO7I861
	c5YbsWjf9K2La6uxCx4K5bUJaLxGz+rrJKcj7eij1YBzr3qOsDEIa8WIFbnX26jOqQsoTzZdLlL
	ywHiKZzW0rgOseafB0zRSfp4jerGOk+CoSSDEOPo2pLcsIKC6iklB31Is3xQ9BfQG
X-Gm-Gg: AfdE7ckhCZPbRpuNf/toOX39g0XpOuwgEDhVYtPZxMzy7ogSyMDGiAU524CL44eM2AP
	itLYtP5LIOWvKpXqzinX9FkQya/jIdPau7nSjs495sfaMzxEASNaBSfcvPk9b0Gtb8kqFDFl7xd
	ISAiMHld3tMwFmsSiLKxEAuPn7JWkDC/JkSkb9f30cEoe9pvbEmZJLrbrfg3B/ey85Rufusf4wG
	61zvY13WaRhTES4xNlJvZiaBdbdVvW8SIrqWIppJ0tfVQJOn1/tC/tReOrLirns6lWE7qOuWX5g
	CVkZp2baDRDjO+BTWwCUqhq+PODA4I5/mv9ujTe6DsvB6YaAziV+as5+jU7ZmONrWCh02CaoLEL
	Igu9Vdr0jwcjtIaTn2J8nWEFrGNg9cVi1+DM=
X-Received: by 2002:a05:6a20:d52b:b0:3c3:9698:daff with SMTP id adf61e73a8af0-3c3ada42d88mr19050793637.68.1784650770804;
        Tue, 21 Jul 2026 09:19:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52b:b0:3c3:9698:daff with SMTP id adf61e73a8af0-3c3ada42d88mr19050752637.68.1784650770221;
        Tue, 21 Jul 2026 09:19:30 -0700 (PDT)
Received: from [192.168.0.105] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm792534eec.21.2026.07.21.09.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:19:29 -0700 (PDT)
Message-ID: <2d87ed0e-e007-4372-a535-6111468179cc@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:49:21 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock
 ID
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <20260720130511.493295-2-prasad.kumpatla@oss.qualcomm.com>
 <20260721-proficient-witty-curassow-e203a6@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260721-proficient-witty-curassow-e203a6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tb3q8_zDgfaQmVhIk0WuzIMvZwntnUhA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3MiBTYWx0ZWRfXyHNEcR5QXk/U
 VbIm46wwed+cH7dCKc/ShaZxhBIcnE11Wm0fikL0/4Z0yphHlM1VmueZdj+LWC5HqjS7vxNAusP
 fi9UdtvuVEEaKgOxB58xbWxh6siFoko=
X-Proofpoint-GUID: tb3q8_zDgfaQmVhIk0WuzIMvZwntnUhA
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f9c13 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=886e80D7AWrxDFE_gbcA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3MiBTYWx0ZWRfX59DzWtAjPq0v
 yzLvQikRgL8mF0EH0qAbNareuyfkQrcP7+eldWgcsPvAvMrEzZJvRgEC3f6GOiwvNYV1jURTt0e
 10sYcrldjs65FYGNo6uyxNewyILzifUJOunorQZqu7e1diwYI1BPA6uu3GCoJ06LpYnYsD6LeU+
 ixhwCtERz/jDbK4BPN9/CquBBIbhmH4taHYNQQ+lazorwbbbYsxIi8iaebE90iqUMin5uyUWNKh
 7sSRndNhAajIhmgP+n6ueQd8fFdv7h36it0P6ubE1Zs+Qhv0DuFWk2+8TV/wk5Sqi2i9qCNvvEh
 VHHXFgQUMXpM+ydunQDh9KAiRw0VQOfQvt6D00Q+im2bINQFeoZNvFsvjifRsd2Tdqj+G1CbVYA
 lxWx+QTKf9PKgizARmS8HeECcOqrNApK8Q0ZjvgzsFpcS1EVzQqieJ3yuNVkb/KLiA299tGaM2z
 IvzYUZq/K9djSLa3H5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210172


On 7/21/2026 12:28 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 06:35:08PM +0530, Prasad Kumpatla wrote:
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 45850f2d4..ce5e8589d 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -236,8 +236,8 @@
>>   #define LPASS_HW_AVTIMER_VOTE		101
>>   #define LPASS_HW_MACRO_VOTE		102
>>   #define LPASS_HW_DCODEC_VOTE		103
>> +#define LPASS_HW_LPR_VOTE		104
>>   
>> -#define Q6AFE_MAX_CLK_ID			104
> That's a separate patch.

Thanks for pointing that out. I'll keep LPASS_HW_LPR_VOTE
as is in this series and move the removal of the unused
Q6AFE_MAX_CLK_ID define to a separate cleanup patch.

Thanks,
Prasad
>
> Best regards,
> Krzysztof
>
