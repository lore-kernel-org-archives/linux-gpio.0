Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38AC37E5E5
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265216; cv=none; b=KeO33czZNXyslXPMo9G1zw36/rXpqJZD/jWMLoUKgjIPXgr6HkpEbTpVx0jCX5W7+IOA3kejgshWyY13+a0KY6Myt3e9k4+Bg2QniIZyDwqb+1gM2S9wgqA+H0337RrA4sNkwjGci7bTOFntmtzE+GfKUA1alpas996tVaK3TK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265216; c=relaxed/simple;
	bh=qXg8sssEt9Q9EeWhnCnsQ6Z9yvVpjqAAzFP2DSeudrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyBla3LO+Duv8dzHi/hWrC0qhKM9chAI8QPsxPuG2sHrG0VFpa1s+y5QgEmwOJ2yO8yb8SdF4ZFBQDdqJaILuFv6kcTB7zFz1wEkiypDLVRfppla80DqJd0CjPOWIWiUdxFzfxASNUL64rjcORfonI04UJa+Q6HJ7eu6X8CNvFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWqn8avk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRcOQcf7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWqn8avk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRcOQcf7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJdLa1767329
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 12:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kN2kJoz7hO2o7NskE9YevJ8bM5MarrXbwTiIKjarUso=; b=lWqn8avknas80M0G
	+rPK9sTcfUabALhvPkswOLG5U4wgEa/xDpbFr4/OSbbYdm1/sdLbJ+PWAYYHXcdC
	LOVA/ADi8OIEXBfoNmGYPRKy8VouuGJqcINCVxuWGoJURicmBa0DTMGUSOm1ZE+1
	V8wnst+7Qg1T2CX+em6qE3TIabME1mBGSQB4szoe8PYVbDcTQ0ObMT1KUx9sMax/
	Ez+WD1ampzDU3z2QrLSH2VJEFiMHqN4kk0oVwx0w2EJSGJs5N0SonGfS+4iju9AB
	UnAINYs+ZRqJGKDKayoum7aJiXLQEI/ICffGTVK2YXL6ZxAbSS7w+AfX47YgeoM2
	hA+GfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx35xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 12:20:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494b1e35cso83761385a.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788265213; x=1788870013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kN2kJoz7hO2o7NskE9YevJ8bM5MarrXbwTiIKjarUso=;
        b=ZRcOQcf7byOjReIBQtpzjFZXIaSxr6TUTj+mhwh14Y3yuSnNnvOduZrp6xQglaSnyG
         3IgIxFxYd880ogejdXlUZ5UYI5K6VTtCVZ81ck2v1vhANNmebLgeY/toDBKxM8haFwcd
         dXDVkKoYOpLTpXOUkb0F3tSMnDPsXhiTODfO83jj9NlPBNYLnqg1XxzAq8s4X4bzK+WN
         RvSy6yhe6OlTQ9w4pxMmD0ucNveY0eXbRqTfbUNboTyU+7iLmP9tQe0x/nlr+D1atiTk
         VbIlyyDS/C1k25dqj/7DHelMdijmMrvqlc2VUwrMV+GLMyxTrmVX1C4WPlYmI5xASltS
         djeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265213; x=1788870013;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kN2kJoz7hO2o7NskE9YevJ8bM5MarrXbwTiIKjarUso=;
        b=Qm2wcNveCQU0+RyvqHfXfImaerLhWk957s+K8b9qtdD0u4r8EXQ3Jn6gf9XIFGfLur
         BD4fkDTOnocRD545CPfxPoBSRW6g5xfK/62T5k3IK1RDuSzKdGsl8/Y76KcsnRtK2RBO
         RXClqOhpa9KtGiR8W23Lktl11oNj3NQECdPeX9EShW2Z8owm/n/xilA8n0uw/0B/IXLQ
         rOUhY03BNjeR2ixyIAtk/upBnYWaMs85oRbLDTNFdkTdRUccYXlYWlMPtIF3puxVHNVi
         IiZHGya9UR/IvXkoDzLbESoXlezsbr1VErQ8YYv35deE4GSTIxdPrTANAFYMXC4FcCs8
         cgXA==
X-Forwarded-Encrypted: i=1; AHgh+RrUYfLEY3nEDZRCl500GX5v9D+KjVgEir9VYG7Zr35nEEvnzRS9CDRStsEwClw4F+S7F/+EFnPAiKoc@vger.kernel.org
X-Gm-Message-State: AFuF++lZg6VCqUdxiWJMbLX7WSqQkcN4PlYG0evLdADeAEkY5rRapZzz
	6G7ui1zmteBTKq3OZGgQ+ZqujHyC6hWY2JgThHunHQy0ZAkNaofyp+9BxzyX1Uo8BKenx0WHSF7
	oOeA8Mq254zftG1b+a1KIKor5qSVWa9jSWovJ46XzUpO8eZqtQvT77niMQO4POkJD
X-Gm-Gg: AR+sD13dusaUpS92rf2AJhzxy6zRY9irnV8U20j4ncub6erDuuuesrpuij/kZc48b0/
	4CTeqGAubqXxGmm3AB/J3Oe7CmYLq5h8n8x6Ybj/1Og91lviX4QgRuDPM0X4zmpIeLTNfF1dhEX
	OeT77JkLQdoM7pyRXkXMTRQvzVEv+OcHF0AJhmey8mwIteoA4Xf90Iph/BPtC024sj0LPaUTpp1
	XI7GLYnrPyzHTy9uMfnW4n/kYHqUagONLgm5LgnStzYrDlCg8lGLtn11NS5J/8M7kBTps9RVcrN
	tI84w2uS4VO6IUJY4SzMg1LSFbfnfDvOHiX1ftSR7jE3Yb9NDDEkqVmOaDKpfiJVyzbAP2Z4hOc
	kQkxgsYnMrqrmEAd+AumpEw==
X-Received: by 2002:a05:620a:46a3:b0:931:23a:83ca with SMTP id af79cd13be357-939287bdc55mr1477160585a.4.1788265212326;
        Tue, 01 Sep 2026 05:20:12 -0700 (PDT)
X-Received: by 2002:a05:620a:46a3:b0:931:23a:83ca with SMTP id af79cd13be357-939287bdc55mr1477151785a.4.1788265211504;
        Tue, 01 Sep 2026 05:20:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2872dsm590060666b.15.2026.09.01.05.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:20:10 -0700 (PDT)
Message-ID: <b4dc8702-212e-452d-b0a9-c9816b545066@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 14:20:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
 <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96c2fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fFHDuP4XVuiI0RsLl8oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwOSBTYWx0ZWRfX/SW+ThqFcLyK
 l0p6tltE+SV2prJDfKpHXslP5teCu2nwcwRWJQu/mr9fUAVYD2c/wTypyjyhqF4y2fGe3hgxQ5n
 xS+FcZ6fMastzalrNXIFqo1hIt2U1gk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwOSBTYWx0ZWRfX7BNtiwtg3cjs
 A3zcy70RBgBjZvaiBD2rxJQdvX4+cWUEmvruRPAQftfwH/YVehGOepxZrIWb7r7/n2X+FXWbq2J
 64aBfbGd9yXam9OrGMuk1Ue/yXsT3BCBKwPkEo13Tu2ZiQn/13ZkPMu6MDr0B7Hk4jIeEmYV43f
 AtxApq8b7lW9iuH5E8m2ZoLolHU+bU6bmbIkgpdd24COZdsEQ8mwrPCV5U8wQf9HzYFIGeRQf6H
 swX7TYQwvPILSNISeAD7d7EVWbuqDc+PvQQ798dsbb+OCKYKZaOfqROQxUcCEmNolE8+xL8GUM0
 G8+JYCil6PY+JaXXd6uBajQB6KDJLdMSNIsWD/mtm0bH7O4rweiSENnkJkFJRCV1cRmQkLMufKC
 rdj2rnciK0+Bc3SU2f64x5oN2Wfonj7qgckpT804WG148aZs+0DsAbHmuK311tlnY3PfoczXKY9
 wmz9E9CMNmp045+5EAg==
X-Proofpoint-GUID: bjn4HjQy7wDP0egm3gyo8CMk0bDWQLAE
X-Proofpoint-ORIG-GUID: bjn4HjQy7wDP0egm3gyo8CMk0bDWQLAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010109

On 9/1/26 12:27 PM, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines.
> The controller is registered as an auxiliary device by the TC9563 power
> controller and accessed through the same i2c device.
> Describe the controller as a "gpio" child node of the switch and use it
> to control the PERST# reset lines of the two external downstream ports
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
