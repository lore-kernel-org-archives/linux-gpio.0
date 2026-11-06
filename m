Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972439;
	b=isq+6S8ZFG9yIEZxRCiXB/LRKedrzorSLtH7N7JazyJtRmu4fKRLR9DDn24peKc47ry7
	 eynQB/XDNNF5SMPeE5zv3JhSnw7uoHfpm31wF97PNHAQ9WgKNqEAA04IbwdjwKcLDcEUs
	 3bVcp3QRjHcfYW/xqT03dLB5m4ahxdvhvSv7wnBJ8zdSQp0Q57kNbjmIsYzqDtX6ONPba
	 rLBBpCcMhdAoDmHcs3T2l4+hNobfbn9rR+ZS90ykRMFVGRl0FNCUuvUs6qfqUug2mkR4N
	 Jis0tZDOOTKYAMb2fGy0Ac18KIoeRakWn7D+2IOZJ4T91JHb8XzABO4gl1P3tJKhunw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972439;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GDCcjK22s0dpHL/t9oPLo+bDI5LKQyG+roTno8WQGAY=;
	b=kAEcv2vUIwHUlj7HfZz5CnY6DPocT/MBt6GXU1aw2pq4/iHAV65rMfZsvvn+bqdf/OYx
	 e5GH6Rvsd08IVJqxMWQOiGiQJWE9APCOPyGVudeZnxqjzpEivp5itw6ANntMTVZOXLahk
	 J59AWA9cDQRDuiZDXkBa+ZpsoBS9b/txopPpg6ZOM5DA3OLinm1BPa5clntj79U6uQ+0e
	 c8uRYPPHOUoC9pbz9MVCEGlx2flZB+RR5Oo2lAn/hlgLmICopF6VZWG2mKuIY9TfiXj8C
	 aC4zmg4xqCfbBUDIz5g6UsP46vLtRvijetrqbpxuEqcBNsMdzFdy5H0NHqub4hVgXqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mt21uQwH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O6uoXoAP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551A7606A326
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 551A7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mt21uQwH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O6uoXoAP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APW4Q444670
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 13:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDCcjK22s0dpHL/t9oPLo+bDI5LKQyG+roTno8WQGAY=; b=mt21uQwH60jZV5YW
	bmP8efFpPjP5ibdMaideJXA1mUJKEe2ENerXsynsr0DD+DuxPZeEvQ7ENDmjz9wD
	dVk+4Lcw6/2YyzReaW+ztxb+6XVhqvQgwyx/DkdCWobxvYkwgZy/nw1wnPZH2tDm
	kISJQSojSv+jL9sQP9oTMVlv757YeREFCcCJ/2R3gcWNeiD2Lgd9f0g0nIE6azfe
	D9fzMwya7PVB4RgOiXaJ5419mGvRKlQKdFy4efXoqwZaw1PuPfFxuln7olNuGMW9
	xuPl4KrTSugyBOPvK7GBE2GFbJKGUgV9Ot4L90AGBGLtpjIXKZ7LZno4xJu7chzG
	Onc5sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u14p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 13:40:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so15488985a.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972437; x=1794577237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDCcjK22s0dpHL/t9oPLo+bDI5LKQyG+roTno8WQGAY=;
        b=O6uoXoAPQknLdG+UoiC0XNQD6G8YE0RvuSiOsdnWOKuxbxDp212A1s1n/c4z9E5SLs
         M4mXuFkVUY19xxiMeaqGGFr1HV8n1ZRX5J7/HUw7ZpKmI1PYZJnfsrZK4iHn7gPPb23+
         biR0ua8Trg8NO9GFVz3u/5mpXz1Udi+WS4i9ANpoewdneLl06Ga5siiESzBPcR2MnIe4
         /wm/EEGZX1B97AwL2GbDKv5iZ/etlX/TT9uNmwSUrpn+LYDwud8QmLxsbNYg0GvaNaGF
         LGoAvsEUuGqKtgVUaRuXZaF1jHBYNRngooLGeCz3Y+hMtt9Sh0EjSH0M7PqybdVInYcF
         opoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972437; x=1794577237;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDCcjK22s0dpHL/t9oPLo+bDI5LKQyG+roTno8WQGAY=;
        b=EYnWZMKLfCg9a4CpHK2/137XCRRzyjfFsrAkxoku51wzQKfH7XTldpXKCYgj0rMYVn
         GQskILs1U5NGdY61ZXqhluRj0m4ut+/wh99hNkm+tt5+FzVgiB0LnWllLp4cGpVb0Ovx
         TA7m6v/x/mpxYoRFLS1bRd3CwvrHbShShUCpRG7Tctqsmy3PoQsXzmb96eU9W6QiL8+m
         NKeU3xdOkHmzhFpnDsxwNHU+5eTGVknbyfr9204jX69H9C8RvZHqVAnaJoZrWuNBEyaA
         lhu1FzTFVT/xdpk9cOxNkE8HNG3QAPRKYFIPdTHjtFyr2gpo0up4GvY5hz/AR0Qw2+tf
         uBJA==
X-Forwarded-Encrypted: i=1; AKwUvBxypuRG9N8Hej+NlJ1Ivx+AHBcO1MOc7ydL3mv2gpOaA2XOgnLNuR/tF5l6D0q+dZ82fKkIXO32259g@vger.kernel.org
X-Gm-Message-State: APuU4Z8IbwUO7pjPfSAfkcKgDhFhazn2AdQEW3SIPPhIZ/3cs0NhOB5X
	4Is9Z84N1oyrjHU8GRiyeFel7Ectu7pnIPWthjIQ1AikY+ixB2HVYvKiTt8sxPe0Msh8e5w9HnE
	tfDQ6l63gvq0Jl3G0tHBDdAEm+jWc+apG7rpMkhmsQJnuB+A4ApnG2rlIxlJyqOzT
X-Gm-Gg: AYBFou1NLX5pll5s+e3KvYV2v5pwyNtWq1t0cg01hJ5FNjnYSVztyoED2be0NZRvhgY
	BwzUsfIZXpx+DWz/KdeS6fWtjAEjmsCjZoeAzsQGszAokIXKR1of6b7eqzreOu1rrgoao8lAd9X
	JZUn84ebeixpVjUrHcRr77M/iRrTo3N06ceFdPgBUYNBFnxurGGpeP4OD2JZ3zEQM2GksqF5/LR
	z93ERWdLFUcn7lP9/XrpIdJz6OR6r5qJ2ZqnKnLvJUJa/ulnbb+zKvGL/V5Twcezue5z1YUnYKj
	iC/Dja2mGnBL/9+BAPippmg6itUqCccByhfowetOtwdAmmJAP6s674LPxEfKZJtZNNn7mFduZMz
	CSSQIcU3EsGxo/L+V7wW61oXgpSFEheawxibhkeqn91mkXJTP+AYUM0fmtdMEvsUdp2bzqA==
X-Received: by 2002:a05:620a:2055:b0:92e:6485:f640 with SMTP id af79cd13be357-945f357ff62mr327792585a.4.1793972436568;
        Fri, 06 Nov 2026 05:40:36 -0800 (PST)
X-Received: by 2002:a05:620a:2055:b0:92e:6485:f640 with SMTP id af79cd13be357-945f357ff62mr327788885a.4.1793972435896;
        Fri, 06 Nov 2026 05:40:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d35673731sm79647366b.44.2026.11.06.05.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 05:40:35 -0800 (PST)
Message-ID: <1e3638fd-ed06-457f-bc8d-1f541caf4c50@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 14:40:33 +0100
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
Subject: Re: [PATCH] pinctrl: qcom: fix a use-after-free bug in system
 shutdown path
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX4vrUy+hPDAbG
 OCvQ5hYSyWA9GflNf9Q//gQvn/NeplNUod2YRW1oT+555szB8zFer/onaxfqIlnpERpdfbKzwRN
 j7n8u9EJ2TFOKBCWPYqTSiAAKqYiH1Q=
X-Proofpoint-GUID: u8oOMNKt7zozku2WnRKawlJpLmDPRE_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfXzbuY/UcZy6yl
 /MLETBDoJg0c0fGjeGB5bR0LuNB80hvUzZC1m8wYcRjojm6lqalINldHBozi9OP/GZoOHLIfhX1
 OHoyYqDgBzMxrTb5J2Lj6CFaEtrS0WFGApqdiXJ+YX+G9v0t45Hv0nMO1IJH+Em3rFUXBBWi8Ow
 GRmHdOCfK+vHn6FxQwBV/eWmlvjx3msEi5VfnYlYERiCTGC/bxS+sAZRQiLt1zhhaGUbWjg3b4p
 ARZrMI7IbOPAPBcllkbJzKSLHdnq1nPlxmI712xB1WdrWa3IfXGlM0MV7R2+r2Lf7VAsH4CaCX0
 cZbsgH4J/CCA++qgD3VNTapCZ9mKWKBdZSEE0AWi/bI7eI+p3GYhFi9tqtYVr+Qcpaj9DcJbLGJ
 yN9aZFutoEVl02HgazKpx3jS3wZDSCDNTFkqPBmhnoaul0nPMOGuwSAwinxTw7YfnLqDHvrD97l
 Jqj8Q8h4fSGGIGeDKNA==
X-Proofpoint-ORIG-GUID: u8oOMNKt7zozku2WnRKawlJpLmDPRE_a
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedd8d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a_ps4GQ-2PcO9Fe_iXEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

On 11/5/26 5:09 PM, Bartosz Golaszewski wrote:
> msm_pinctrl_probe() allocates the pctrl structure via devm_kzalloc() and
> unconditionally populates the global variables poweroff_pctrl and
> pm_power_off.
> 
> If msm_pinctrl_probe() subsequently fails, devres resources - including
> the memory allocated for pctrl - are automatically freed. However, the
> global pointers are never cleared, resulting in a use-after-free during
> kernel_power_off().
> 
> Schedule a devres action clearing the global pointers that runs before
> the pctrl memory is freed.
> 
> Cc: stable@vger.kernel.org
> Closes: https://sashiko.dev/#/bug/linux-0c3a18a4-3de8-489b-abc9-e9e3a8641ed2
> Fixes: ad64498762dd ("pinctrl: qcom: Hook pm_power_down for shutdown support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
