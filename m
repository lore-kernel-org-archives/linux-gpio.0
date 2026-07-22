Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DD320297C
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726528; cv=none; b=R8sa/i9fNL62M+GJ7GESW0HFeDZWegn4kgpGvkx7AGAq9uR5ZGydwRoVHARavne81DOwefAgJH9GsAeH6WtXSWHHtvuoycUSQJ1H9ZYoC4vNng0uegTtSh+1sve9Qtl5VBRSKeaNT6GHqTer14CwOHd4umRRcNQl3no2ruy724M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726528; c=relaxed/simple;
	bh=ijFJ27x37TWp8pPvINsPBlZzbdhfg554r9bfHN74l7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzSRKywnV6hbo71RTjSBMPPct7ByuyP+9mirKiyeS1BTuFAP2ocesdB3jxFRK9ziG7sKvpHVUmsLWrGW17WNJ4gQuupOCQZ8BOb3fp47vcgRKDRqK3VsYRvIZRNX/4UbfG+UXUY1SRUmviNS3Q7KDixedF5GaoFkiCPhN1eBa3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djbyVli4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUtHha3e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djbyVli4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUtHha3e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1ptb791702
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 13:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=op6CnVhclF8eFtei1N9uhkfF
	+x7LxdA+Lm/DBgG9PP0=; b=djbyVli4Q+U2BazQCScefKaO/CuPB7apxyLSyrch
	rCaCesjQam20zRysRQDdreaBMT6vIePA8U4MBLG3FpSu/imUVca3BBqhcGSkeX13
	uDC5D0OmqF8u1GI3fiRskm1cjTGhFQssXnYlghMP5Hlw7oLC7ypBohZYxHX+5u02
	4yJxp1etWTxwncUjDYbcskxiaweeWg2GJfPFcD2JZ2f4xsDtnJ72yaIDZdGEeMd8
	9s9v8pDTJNLGP+M09VspVBHhMRt2Mei3PMfzUNAQ2SN5sqCOmi7iH0tlrUM3WF+w
	nlpbWtkvaLSqFehtTgdBeyFi6J+dCe6yUL+ONBfbsML+Kg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn2a2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 13:22:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso147367741cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726525; x=1785331325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=op6CnVhclF8eFtei1N9uhkfF+x7LxdA+Lm/DBgG9PP0=;
        b=ZUtHha3eYQlJ6uh2m5zMs+8KwOxTspQD0oeSplG1dwi+EFF+U8alfsgcAWYOreWj3G
         +j7zA/xdtifC3ighcTgVnMauJUGW4DOhZG09S7TVsQuRH7RUe0RCxB3A17M+EnoZdMTv
         JIZbMFOVBCb+qj0qSIOCgkM6TY/qBFcG4DXVYZ0RO45uVM+0rOGDMbwmwQ38K/nIw9H4
         y5od/s5JDQHOJMD7wb1r2lEVdEFs3irtUhbDu+AftIcRuW1bgiLgHrfEGLT/keoX/eKb
         STBFbUDbAFzSPCPL8or6xvWoB8m43+wfOLwpKVoBAWMTdOw8TIAZ1mg9qaLDeuxjagda
         wd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726525; x=1785331325;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=op6CnVhclF8eFtei1N9uhkfF+x7LxdA+Lm/DBgG9PP0=;
        b=dCqRMWxPVQKsklTDG18Xu8uC+P8yZ7jz+iuxzHGkH3GSwv2sYGIbre6pfKn3pDoHwT
         P2JPWS7bphUi/RrhFj2A831qtX4f+tdKxE/2Xpjgq/MA0x0BG1hexnBhdTsnneqyoUbE
         1RgmGXOxrxZ3y8xSqlM+Dvspt5aDvmKloFehhKDKBbO1vG9p+xKvlQ7GT7MT/nXCYgS8
         thMEc3JBBK+Uz9+KSPS+uYKlZAQsQYpHddW0OkCa6ZzN7EEyk/6WQq0Ds3BH3bg1wwQk
         04IQzXtMSoexOm6jm9KFXl3CF0jYT5q3OX1dQqdsMy8X8D4enLJcRdxV5DdQV2Rqh7ie
         DdhA==
X-Forwarded-Encrypted: i=1; AHgh+RowKGhI21y/Ll96JnjvNSrX9XeNVkBbIrpEtOaanKZ/1VS1B6J2t3wG6j5eHiWXsgSp3JgpDh+c/c34@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/QziwZ2s4zFZhO0VAsaEmC2XZI458q4vaD4IVN/fc+P7KtZz
	qs4wStpmiUOuPSYbHfE5dYyTdaZsr34cjwADAADnjcJ1j9Gg26/iidQKpaADTS3gTsU0t8G6s4I
	kxk/rTuYK1vAKEXDeAR8vztN1kkGW2K4bNIZztqGmmLPaED4FvqpXN5v2I6gtrlYW
X-Gm-Gg: AR+sD13EYppvBtUVKeT5BdiFDr+IjwkD2SQeX+DoZXOX7CdSA0IZont5Rux6LhHkCL6
	gJspBsScHijwkjpzoteKVaOPT4S5oKZFPRlL7NiOo5dXzKzJGBpmGurDzKMuCGAZbq8moYFBEoF
	DhzrtECBFysIqnrSS3UeduJcCn/BuuKhHcqkdvD8gTr8AhxVlgucnJBKoZdcAQLpLNZBLmCTw8e
	lDmhPyaeBq2sJ1BtWgIK6THRD7J+LrcTuDA5LpsWkm1UYHUFrdRivI++5jCfuGelpYVHEeyHw5x
	coS6l5MNEYs5v7Jbu2MksX4bNMTiFADlAj9L1gMQTMgeEo1WXb8EoQdodq1KTYvj1B3eIzEmW+W
	o/NtRVl9fJq71NflGWIfotlF6z2x3izTK0ATkdWQmZYGMo/XYn10V9t0FojwOGkjjXuciRK0728
	DbSYkvbyxmbAcaTA==
X-Received: by 2002:ac8:5913:0:b0:517:6631:101b with SMTP id d75a77b69052e-5213f66b7admr205097461cf.55.1784726525014;
        Wed, 22 Jul 2026 06:22:05 -0700 (PDT)
X-Received: by 2002:ac8:5913:0:b0:517:6631:101b with SMTP id d75a77b69052e-5213f66b7admr205095821cf.55.1784726523002;
        Wed, 22 Jul 2026 06:22:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d318c0sm479964e87.38.2026.07.22.06.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:22:01 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:22:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hans Ulli Kroll <linux@ulli-kroll.de>
Cc: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: ipq806x: mark gpio as a GPIO pin
 function
Message-ID: <k2nydxmvoakipaiym5bh3xi6rtulj4q5dx3yihdp5gh7grlzt5@d7cvadgsqiki>
References: <20260719134548.8830-1-linux@ulli-kroll.de>
 <20260719134548.8830-2-linux@ulli-kroll.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719134548.8830-2-linux@ulli-kroll.de>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60c3fd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xhfSZxL3de18q6pc5_wA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4NGNfEm5EbHCjE6nunIDt6Typy0TW8_Z
X-Proofpoint-ORIG-GUID: 4NGNfEm5EbHCjE6nunIDt6Typy0TW8_Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfXxEIrP5iPk8wp
 5z/1MVGkxlmYUFvzPu5YWPEPAlcJAQR02wfJ7l22PPoMHUI/I8nb6SvsYR5hI0dLIQ0UBjIxqdp
 7HRic2T87GDPwZ8WH0i377SOG8GJYR0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX9AuvVgpfxOMi
 5Zx8KQI2wdOdytpeZW1oxspOAEvA9dbBUN4umwpHQmIT+oGXO/sGCU8ygqrOyIhaq7B+l8fMbOK
 yjxhhs05z1AwwcaUV+4Laa2tpIuYGyhDEXAkEVxd9oWTlZKcGWruHN7AexgRhXwi2qPB25eQ2yk
 AxSi35us6BqKzsTXBZ79WejB2mRAIBFFgGZiDqT+rR1wrhcTlChr+vjTELNNYBQud/4PjXySFV+
 EoZm1c6XPy4VevXEvWUuY6I3kpeO8rtHB/9ug7Nw+L9zW15KOnMvZVb4OQ/lonkJftaT88o15by
 Pbs9Wx2eLX/DA6raMHELWFElWopaYxjDs24cyeuk37rsU84rdWiDb4lKcyUUS2pMsA6Z6Czd+03
 +fA1PNBRRtMOI93KT9ted0LSsjH51t7I26VQEQD0jGJ2L7X96rrJ3+bjJ7kMawR5BHBOQo82Ve+
 pMJXxlceUHKlM6fSiSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Sun, Jul 19, 2026 at 03:35:59PM +0200, Hans Ulli Kroll wrote:
> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
> 
> Add a IPQ_GPIO_PIN_FUNCTION() helper and use it for the ipq806x gpio
> function, matching how the msm-based qcom drivers handle this.
> 
> This allows ipq806x to keep the GPIO-related configuration in DTS
> without tripping over strict pinmux ownership
> checks.
> 
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq8064.c | 2 +-
>  drivers/pinctrl/qcom/pinctrl-msm.h     | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
