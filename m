Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447345;
	b=Boc33P0/WjwTJHp6yGKax7n3nqDnGRmrkAD2ZXi6EwkGVixSTtruc+Uc8PKsdhtgy+uI
	 uPRKhuXZ9zcupNMG6+sASBWfKzprpQYAD6nmJ3w1N6HNGzUUb7f85CFWj+TyqPlrBSTrO
	 AFsdkXmB/sQzbjGbdajU0z/Dfv55iWYkRNPbpYkC0l2y4GlhGZOvn6pRz+Ed9sMLsbVP2
	 qQhtFtC2C+pBl9g1TBtqO1dbUSM1XuONj6LNHjfa2Qa4Su0OBS+o9+nEs3mJtOjtnHz5n
	 gdxL4JwIXe/41kKGnE/+VpxHJVuoeADwZ9qJf2uUDhtwe1t8z9c3Bl64OCzy1XTNeBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7n3kUpad1a1JshKPPgB23JOaJaNZsFOqYQ9qFtOn8h4=;
	b=2bIXgM/MLvT1SE4brsErm1lqFGUvRqxMQtXXbPvNFISfUrRIKZfuTLjiR7Qo8emJ0DK9
	 nf5I8+2JAzuHVpMgLU7xr7sKIDFDxVxoeYgYYMc35jYn46roqnQdwimOi4L9JmaPQzKoc
	 9ObE45KwwR675N5ZnihfF+XdlTL1Jj36Fjt3TZq7JfG6OiKDE+7eBLUfL16vz6tXWCsa8
	 PxRKajdgEK+cvDh3gZ6/c8VXsFgKZ2v78Rs+MJxwP/+q+pCyFtFq+B2Qtg+or3i2XLx+X
	 8xalnDR3vrPEtin1t3PTVI23foJJtSRormhA3RDeirbzeY/OXlO8qYdHbNG46zbd1ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZcnUk8H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kq3Mdtg3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4372F606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4372F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZcnUk8H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kq3Mdtg3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLb5f446764
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7n3kUpad1a1JshKPPgB23JOaJaNZsFOqYQ9qFtOn8h4=; b=nZcnUk8HF7vf2ziG
	a4G21tYe24cDEjoNAnHetQSn0W6TlchgP0dYkjhnLe9SSVug3VU6yapv2Ko7e3CH
	nUMp6ySaV0IAPp+zIrafUyhrbX+wTRurtdV3SqEox2MgynV+H1y9kgjuIKp16r/x
	hiInbHLghkmvnbIc/KNa5AgwMs0dZin1Fz+tesO90c8pRGaHcodZklAgc9GybcIx
	dDG/iej+RTFWdN1VrxyX1yuj52xh20VfLxN4fiU2s50Azxx/QpiYRNXpUx/EMEQP
	IntS6kzkK5CaG48iKzMZsZOQ+wcBJP761dpdVyMCs29FJK+TWu8c76E9d9VKZhzu
	ISUGyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7421ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945e8a244bfso29507985a.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447342; x=1796052142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7n3kUpad1a1JshKPPgB23JOaJaNZsFOqYQ9qFtOn8h4=;
        b=kq3Mdtg3nsGP+Whu1h2Qz05EEayizadmY7WOHH6D4nDHPpJGpLHwIjrHYa1ib1yoEq
         /hYs9iuECUzIILZnJ+b9/GxzDMD28nE7k1i8gHDOMON8MXl/1vjiWDTw020/t/p8slDp
         2W1tcz5jOObvKS6ttWrlPfp6mAO8+HO0poRKNgpKvJ5EU1nkJ3m49U1HPdwixWGcSZOO
         RhaPn1kb67WnnYOjicuj09U7oehup/16DJSLmY0wKnJPAjOWYCpMg1ozIidYf5vEnIpl
         7TuZL2niDO5rGj4jdEpGGoyCrLlPpFhAdM/wMBv2Vr2UhzEd1QFQ0sV4dtXc8TQBHKTk
         /lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447342; x=1796052142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7n3kUpad1a1JshKPPgB23JOaJaNZsFOqYQ9qFtOn8h4=;
        b=ZEFQTRNsgUrkh5LYmKOHOEX55F17z8qY+wtg8EF7Cn0JhnzmlIQhM5wo56RR558fxq
         F5ks/Lk37Clp8JW4zgTDacOAwvLpm2PVj3EeGBkPv1WfxYDQ/iYDUMA5D2JTCgx5x3Kf
         FlR0OqTtJzjoRjwtEtBkDpEed2m5Ga/9f8jYi8wuUEuIItcJaHV6YvgyEOoei3vzIMMt
         9a7OK5Sl9mYEZLOw3G/S/efWVo0fO7CfRoPsZeQFHpqWq+Q3sw/4/JceAofPVfUjDicU
         WtNZjo+XESmbjsfGiSf7b29ny3puthpZH6Z8HNty6/m35Sec2HJf+azkdcGyqf1k8r8v
         3ubQ==
X-Forwarded-Encrypted: i=1; AL+hErEA1YSg0xs6Q4WJibqfuvGkm33z74Hb/X/gMhDiMii0hDGvFCv+cLqUaMvE6J/5cNAMAEs9RSQcx60W@vger.kernel.org
X-Gm-Message-State: APuU4Z8SpnY1Xx+CrIWuQGBIr2MNSxU31OrwF/7TvTcRdJyeUZOxDiVT
	ksfexbJu+gWUo5tTo4HgXEVnU45EnRL5Id+CwqTlRO2666keWLa+3MF7Kydgl4apeRloK2UgPTx
	A82RRHDbjHjCUVqBgUnPZ85ZehjLScSEL8eA0KiwFHQYDZe6i7Ur9kyAplqmMB+Y+
X-Gm-Gg: AZFdTZf2t8OgYVr00K68mEMhWIH9qEgM0VnJQ2rMHl+P1hkhipEGD2EV67BXqP9F0/R
	zPQjPv0lyJs8K46C2EH1HwcsTeTvDJfq6IHy/tibHrUaoWNkXzyeMhxBoBiI/JG4VvlDTBXsAPw
	UBA4f6wAKYr/EwWcR+t5OtYfpFe6r721CnzrRaDtocMytISLbrC3Z/+F/f68lF1X5tdJpxXlPT9
	SyZkjCdQmz53uuZp4T78wwia4KekMcM0yLa1YGjGAN8HBvZ93Fq7mo+Yx0F8SO2BMZGq3MD+y23
	ZcVfriKFhs4mtMg4act/546wfpR7KP9ixUzhK6fdzxJ1g1nxj2zRihTcvVYck1FEtMA39gMM3Ch
	trWFZpNm+BwBvk0qoJ2d58r2kocX8S1faJ3jxUP+ejf7QW2ZSELJNXA2RtyaN/zOgUa/JGmk=
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr1901315085a.1.1795447342445;
        Mon, 23 Nov 2026 07:22:22 -0800 (PST)
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr1901309785a.1.1795447341818;
        Mon, 23 Nov 2026 07:22:21 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm427828266b.84.2026.11.23.07.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:21 -0800 (PST)
Message-ID: <7a09b249-ac07-4868-9a62-fef4d8a547d7@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:19 +0100
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
Subject: Re: [PATCH v2 2/4] pinctrl: qcom: Enable by default MSM8917 and
 SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
 <20261123-b4-qcom-kconfig-unify-pinctrl-v2-2-958e205b1f60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-2-958e205b1f60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xbF1N3oq0xvLa8P1gHA4xEVNf3t2U-9T
X-Proofpoint-ORIG-GUID: xbF1N3oq0xvLa8P1gHA4xEVNf3t2U-9T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX3IKsuVh6Q3+p
 HR9y0ug9aUHslDV39AZ6ncxZCo5d3IuxXiCk1m3J7UV/kS5LLpoNePX2fx+hnYSH6CloGf2nYUO
 AG0pJnX/noqoIqxi0WxClNya3nXhhWk=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b045a30 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qJ9BVZF9c7qZnBjrwvsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXyuEcmUovHfvw
 pQgHhVCTbsOpOwRCY9pgLziHt/icrpVug1IilhU5JP7ZBMdFbOmGlqGCvHOJiVxvliHamszEYTf
 eNziaR6kcU/5iGIa1p8f1Ji5gUx31HNX2kJkA/BooVV5fVHdI0qzKOnds5ZYyc9H1QOGe2Zutk8
 VlRdV+PBNsehtJ8I16VGtwM5Dmgu5t+ZxhH3TGI4p3vTObQ6TXIIPQB0joP24y33nFz45vhsL/h
 k6Tpkepwj1LmZvMtBThyD0MpttVBdiahkV4B8oL/xiGrBS29lp6SJnKFPnSNVMr8+3MYZqyY5pc
 ybHLNxe3etTcxYLL0550FKElZ3w4ZARL61Zl4fGMgSUcppRjzBXftCpN0rKVzzZklMoKbDS15X1
 JAsFcJm+j4b9aKuzULr9KJXJNSZVbcQZbTBj9QTL1Ud3xO/h17ZNV5eq9zwM3rF994utF5WliH+
 1tDbGB6gAGNcmaL6tXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/23/26 8:44 AM, Krzysztof Kozlowski wrote:
> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Enable by default pin controller drivers MSM8917 and SAR2130P SoCs to
> match above expectation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
