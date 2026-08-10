Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3642541B8C4
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376550; cv=none; b=qC68kmyluIC9cOCn8fOoucmHTcKC4iumHes5LgKD0ThW3UvpQOKqhs6FUnN6o4g5KmSQg6P0OGJVL8ohUpcpykx0h9GdzJWJdANypnq+VHc/pqwOxveBAY9ZRkRS/UQFFpp4ZZQU+CJKfLUSMXBayR/HU1udP4Si4mqmZPQEaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376550; c=relaxed/simple;
	bh=KOQNNO81+830lW+Q5k5LUwxKxi+2T+vtgXBl8cZSLfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAkreJAtch8XrCFE0/Z/t0po9jav9LClPKPRcSdN2gQvqu6p6g3A+p9z40Ac/npq78wIjeuq1gGrPZzHOoiVk02874NYcm701cBsSihRdPnShW9bbqkNQ1BWEy8E6jeIXKoo/6Zwi9xadM16nj1/jz4pdrFk+d/5Kl3/ZP+HbnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxdmszqn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9mgvsxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxdmszqn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9mgvsxs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWNVe1982837
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwWUHl7i5SxMpjZvZ8DdyGzjAdldYolgun/dp8YjJTM=; b=jxdmszqn7wOWgM4g
	BQIxMCEhb7VA4IFBuq8zWvTYwal3EbxIy/TY5wi9PbaOaFD1LL+aH97yZQ7HvRI9
	K26RBeI/XFAlm6QmUZU0OsNQ6QV5rCutbp/nt7TkwZCpgbg9+BAcxfN8M4pSEQgx
	IwaQarj+/eWbFERrk8p7OKo1JOdPLkIGAd5uBlAXoqTjybvAXITMGVGG1AHSXLLb
	NYpTv/JCbDXfMIlGe8OL+AofhJ5H1jwNd28tyyrlGH9odQjNmWPuMTuz/F8oTrKy
	pcQ9IuPXo2pcRVkOeXjJFikBf1YOZK+XbYtt/rjtZvyzSefQ0RqUcHsUW8MXPtDk
	GujWBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6tcba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52cd0374265so39784061cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376546; x=1786981346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwWUHl7i5SxMpjZvZ8DdyGzjAdldYolgun/dp8YjJTM=;
        b=j9mgvsxsu4ySRN0CuyL2zQIg5Fk2Uvkd9lFYSq7Fy8s6pi0QzY5z1+W4Jod/EC1vuC
         fsEKyy5iyKG7uBLOqKa4m8UDe2ndvsBKLgjNgA/JZD0pVVJ9ayT80BMrpXlGXUVVRM/l
         stHPRdnqEm2L1wqFeF4c6AXxOAe8Bo0yyiD3Zy7ZER00nKXvusyVYR8xzDaNchBQi8jK
         rgFb44OvTOZHa11yzXqcB7w8+vSONo+Z7T99UWDidQcCqx1gRNvT5hOTbpR0CBld1kR2
         Og20TRSXdBF4SpiCaD4AthIczO+fCrvSipwL/KZcbS274neJ5OndIcyq8r0sDi47f894
         zVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376546; x=1786981346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwWUHl7i5SxMpjZvZ8DdyGzjAdldYolgun/dp8YjJTM=;
        b=ET0MiEUj4+BWJUylgyr6xtuYiqSQcRMoiSMB6WMg2OKvl6jC84/mKisXD5C8tBzG4d
         CepVnmuMJCHG7h6OO77LJ6cwOE1IepLT3xa3qgecWg58gfIqg61oqtaP3jxWWEw5p64d
         Fn+7oTOfnkUW6J1zZmJhqRT3EHRaxi5cw9Nmf7uatuhFFr6qqcZuSOvUkB/K1WrDNQXX
         Cpk35VHU+9yeYQlTBTblRHIgZZaAaN/J7gySeMD/dFbnjULDkkcXQAL0xOb3ChHJdUxv
         hIMu5B19YURXnN9Rqpl3aliZD65o5OyMdC5YLHxabTFIbglnr3MipsLNd6jKVnBX9poV
         W7HA==
X-Forwarded-Encrypted: i=1; AHgh+Rpez54NgiqxIWPKUKOPNZQfkMxAzssCRppCRErCA32J6tIQD16rF18Sckd+dQFkIcuRXq/ujCgi1Mzk@vger.kernel.org
X-Gm-Message-State: AOJu0YwCg5aXU3qxBidV2veLRr3zu72IjoLAMEsGeALwBVFiaP4B7m/S
	b3sAZYAeWqe90V+e1B2ZxRUZNNZa49fZfAEjMga2TwuH4RJ7P36QrW0TwBDeRPniXfVwkyGZT1w
	De/rQqoIjUkdoSqZaFtWQp3yaxi/H9LeVaiTWFDvur+qp8GqcT+KtsSaX3wu1+6q9
X-Gm-Gg: AR+sD13yny4JzvaakJ2/8ywg07D9majc32wRVp4akKq3d4QvA2L2ePQmKVGACFYsX15
	Tt8hJcWZkZr7xSScb/hH3hOhaG+y/MikCiz0FiGSRjeRfp3msyITr4MNoVTLjsQD0pnTZqv4PdY
	4TNWAOWGnisP19k8MCyEhgScK8smz0RA5dW0T8KEJqQ4kp16BIm9ZT2R+cb5SWxGb63q8Gb2lZV
	CRDhJer3198aDIsrL8gZAxZH3+a52pvyjDi4Fej7GAt3xi7UTOXKiJr3G2J2m+5q6uNnxXTBep9
	LkqGgMM47BuvgGKrJOpYWpWbXVUC6zXcu8X0dJhORRmyzQSXhnlrChZ+nCIMTbCn8RYBvCCfzUP
	LOb6MoVuXL4pOL21GQp/3b2p0JrWHSt5XZqoEFB/XPQ9MYJkHtYO64vVUyU5yYRa7+HF5LvIXMi
	uDvpekmbbQ/dO36A==
X-Received: by 2002:a05:622a:1e14:b0:51c:d52:6049 with SMTP id d75a77b69052e-52d20a10f1amr262582631cf.28.1786376546339;
        Mon, 10 Aug 2026 08:42:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1e14:b0:51c:d52:6049 with SMTP id d75a77b69052e-52d20a10f1amr262581891cf.28.1786376545891;
        Mon, 10 Aug 2026 08:42:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:11 +0300
Subject: [PATCH 07/10] usb: chipidea: msm: do not force the TX FIFO idle on
 HSIC instances
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-7-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KOQNNO81+830lW+Q5k5LUwxKxi+2T+vtgXBl8cZSLfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFREDbAEKMO2A2Qs9sERI3xq59bkDCER9uEc
 7ajvN/A67+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUQAKCRCLPIo+Aiko
 1cMKCACItVH4hSeLJfpkqgtM3Mn+A0oSAX0xdpecK5aC/leaBuzd+gGevn7S9wcw4VTojJH0NY9
 dlDqP/dudfyiT5l7h3bhhYGIq/UmrMHFXjWHdY2u62V1hYgendPYLbXSSpPAeOKKKE2p/amEH6M
 uVck/ccgyD2q4xOK2AXuzcyH5Zm9vobVl0taSLfCTB7wvYltD46LNhXdMLePE9DFsID4VJLdFbh
 9Wth5gRpr2OSRCyTDtM9tzLupcOH33DHNSyCImYJuWTGYg9LnDODCk1HKcyN8/XMFFdlWX5hJcL
 hugegT0rjwOPAlYMZpozWbu4BwtyYPhlag1ogWOEb1BpZdyC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXxGablJBHtDnk
 3lMP3n/MU1pYxtmwE8grXAD3M4tN+KGzlUqdHgYSg+u/PbVe5eOJUY9W9WIQ/H2xwbaxulX3I1y
 UENdLpsm6mCobykawi/AbsP7uTKyZI4=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79f162 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Nuiyuvcmx6Gf9mYuf-0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX2LbzvC+KcSJC
 PrWIMNKLTcnQWgvn8pEZdx9KglWtjt1bb1PmqyQKGcuc6CkfzJOJ/0usFSt1BMCQ4NY0RdQCttC
 jGbrEHFv81DO/9M8G/8VGWHeF+JyKS1Zgb9hCgZyU7eSNVvLAxDAI95Fbt4TU7w1HYQQlEj6MLD
 YEKfnaT7XZJ+N74UdXJ7bdYzMjxl/o3MWk6Ad1SI2TFhhQQ/A9WlFX6WbOmpNVzvXEiGBm2RwzW
 9pBnUAJJUnZ23bFcTDJmC8LSvGaZZO07T/ryoY42BHq2har/Ud6Jqy6eMCFcdnKdZ2fF5H2kMfz
 4QdLPTOTg0x+3EbYH6sdolGQc5U/8TAaQgGinTnkvHgTiOja1gq06lAtiwOrE4OFZu61+0giQ9/
 vJDme2uvfTdv1+Eab3CPwc5AUrttjas+b4LPayvEmJq6yOLDQUGtN7eRCaSVJEyO9aTAMvPQD03
 gj50GvGXzVNg8CPgI3A==
X-Proofpoint-GUID: O8llNjCq02ZET-HoVo7qCPkfZz5M48-Q
X-Proofpoint-ORIG-GUID: O8llNjCq02ZET-HoVo7qCPkfZz5M48-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The controller reset handler unconditionally clears
GENCONFIG[TXFIFO_IDLE_FORCE_DIS] as a workaround for an RX buffer
collision issue. The vendor HSIC host driver never applies this
workaround on the HSIC instances and leaves the bit at its power-on
default (set), so clearing it makes the HSIC instance diverge from the
known-working configuration.

Skip the workaround for HSIC instances, like the neighbouring
GENCONFIG_2 write already does.

Fixes: 47654a162081 ("usb: chipidea: msm: Restore wrapper settings after reset")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/chipidea/ci_hdrc_msm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index 9a9410a814e5..69be194f8e27 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -108,8 +108,9 @@ static int ci_hdrc_msm_notify_event(struct ci_hdrc *ci, unsigned event)
 		hw_write_id_reg(ci, HS_PHY_AHB_MODE, 0xffffffff, 0x8);
 
 		/* workaround for rx buffer collision issue */
-		hw_write_id_reg(ci, HS_PHY_GENCONFIG,
-				HS_PHY_TXFIFO_IDLE_FORCE_DIS, 0);
+		if (!msm_ci->hsic)
+			hw_write_id_reg(ci, HS_PHY_GENCONFIG,
+					HS_PHY_TXFIFO_IDLE_FORCE_DIS, 0);
 
 		if (!msm_ci->hsic)
 			hw_write_id_reg(ci, HS_PHY_GENCONFIG_2,

-- 
2.47.3

