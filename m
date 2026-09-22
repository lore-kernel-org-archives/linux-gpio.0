Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1F05275AA
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066584; cv=none; b=XnfPk6igYaDfeJkPS34HFR17ZKTzCJJDYLxwXXCafT5R6ATq6lA/vIOG/U+X04kW6AcA4hn4Nafd07bC/J7SyVNZ2UfxXGKbOk19toLfbwvgW71/5w2D8labtTmsc3knc+kpphPTJbT57F2f3ntFQIqaG16yik2iFVhSfL6b+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066584; c=relaxed/simple;
	bh=pXqlOkMzl3JBfz0/OwEXm1d/v3Shbgu96oivzcCF36E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BACGOvoO1KIwEoMOa5kXjZkYXCvMrSk9BxSa2sMbnpTOI/FLPU/iuowuE+DRUHZFiYxUBBSVmGeye6gXwzmMsZMOox+Rb1vmFu5Md+ujbEPVK3GpBLbYeAfH6TkOnPLq5Jpma2/F6kE1b+HHgZBqA07NFWA9CmaJwH9g1CQmdsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epPgNqge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cx0yEdDG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epPgNqge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cx0yEdDG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2sLaa3675278
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 08:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DlRtbPmn3NgSdVIqkYavs8zAzN8VtemkTrdfku6MeYQ=; b=epPgNqgeSBsbuVt0
	lgzSnc9ZhlszBTaHh2wg1PBvcVDozrkF2cpb98/urjEjWisJZJY0ZtO7Anpuywko
	fpm2YglLDO/0QD7cYjxyJCGYinISHwcJLms0m4TuIgxo6dLjPsXgUn8jLFIOVkFm
	xmjYyTU3bo++vonbNipGQ6z4wvDICi9x+G514XgycZXNDcgKGiFilnrxGkJTKTnM
	pAbOR4G5FA2OiK380iVIKvNo+DX3ikcdOPpeOzhb/c+CpePghVNpRteydPfNGrF1
	CKUYF/nygiTWgWMYrev1QLbTeIgxMEtRjAQJFgh75OmU38FP8uPBT6kpIs3qZAXm
	hY/5Jw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5s96v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 08:43:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso682910885a.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 01:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790066580; x=1790671380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DlRtbPmn3NgSdVIqkYavs8zAzN8VtemkTrdfku6MeYQ=;
        b=Cx0yEdDGM1Pgb025zHKZPWDql5+B9F2NsZiBLuDphQnfs/9xibb9gznjFBUAWFTucx
         oF0PYsjaCOMwHHme3zXV6YmIJw0Ccgm0n8q+LcZQvbbWtjxMVpFqfab6OWeD0US/td8x
         Xy+x/JfVWt/Z52OLQIXst7tkes7MtvuH0N2o3ahqwu21dJVBcDuF08tfMAgbVKQdzjcy
         VgAZA1bWR3aUi9JQqRtlatxz6RUGMku6FmiLb6g2S85BKsPHhzQi9B5c1oNxG5oAo5ZS
         3UrqABhvT0VKg3hi7BFoUmeZxbOO2moLlsqwMkDcPTbuOtQL/P/kx8q1lrn6Zm6rddMw
         Ftiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066580; x=1790671380;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DlRtbPmn3NgSdVIqkYavs8zAzN8VtemkTrdfku6MeYQ=;
        b=1sjcL+RiATh/eyjgaIdFkgMpHgGGoWkVKvbgiC2pDf4RDXpT0sclRQ/8RWzbPAE71Y
         HasKTMGJbgU9u/Ax+H7LScBxyj1A2Z4Eot4dtUVB9irTJLU/Z2eVax6Apbw4gzBJEC25
         E0JA9ks1YlVJdvbFNkKIRNQd3HA0p5wbF5SiHgZx4Y2//VRrPWrz1nVo1eX9u1K1zX27
         st/CT2jM6lgO9LXwt844WUWxk5vcLaj4yIuBQCaV1ymQ2FAERlME2CpjAzOYIZr0RA1a
         sjz/QJjFQbm1SuC29/rpIdHUrfceTFOJZZCXxTN+EScPESwlePmwsMC2LFa7KUMrTY6u
         H60w==
X-Forwarded-Encrypted: i=1; AKwUvBxUiBzSbdYuV6E4EpkzCw++pbM1XteREIvq41yxQkAO/0OMih32OLLJwrxQ/bBYuVS6YK9p7JKCh4Mc@vger.kernel.org
X-Gm-Message-State: AFuF++lvOpLNV8Rpx7aMmv0+1TOPVyPh9qghhfg5SbI3M2+F/KuzJaNI
	C/g/t1oqvy97cUwzu5Q1JxuYQPqRi1AIGL0dSdonsbhy0m3vQfjtsUKIiYvYwoiWP5Yju9L5y3Y
	Vu0ukJe+quy/wDOMwuQnBoEk5E5e3AFPqQ23nVMaLWA1hBhq4+DYYNA6FVKzk7U/0
X-Gm-Gg: AYBFou2i4TVgfzAFpJ/F8BXRcPPYcJALhOSHTTsULKsmNuErn291QAt3delGtfrMd/L
	3VXsszRrYK4OI4tL8zax0MKed6Zf6EXKLkYshewlQw8oK+d1EXwL4EPeFQtHTq8nx904aXFluNK
	5+th7ttbq1CfGvUOmgeWFwqEE5ik68u/onFPuwSMhcPriKyWojp4eHRT1pSoS/IQdFG1s8HBZn2
	Rkl1Y3P+5PF6fijO6AOk0wC0m7kWBnHeQh6JkvniuRA1zYS/J2K69iXD927aeqzqpuB+sD9fBQD
	2zT+X7GcooxqqrEj5urBxVjVjvdPiWbrs9TaftPK9bHgRA/IzBYGUHWVaBwkfNj6sJfiuyZDciF
	UIkY6kSfqPVKMziLHDbTR66WpWQ==
X-Received: by 2002:a05:620a:4083:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93c15ece6c1mr426386285a.59.1790066580313;
        Tue, 22 Sep 2026 01:43:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4083:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93c15ece6c1mr426384885a.59.1790066579957;
        Tue, 22 Sep 2026 01:42:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862774882sm3404017f8f.13.2026.09.22.01.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:42:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: dln2: use assign_bit() where applicable
Date: Tue, 22 Sep 2026 10:42:57 +0200
Message-ID: <179006657513.13182.7255050775005689990.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918141713.3022960-1-peng.fan@oss.nxp.com>
References: <20260918141713.3022960-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gAn5RqYyRSBZGT2pgU_gvu1u1mrbMIZ3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEyNCBTYWx0ZWRfX4zr5Em/xfS6/
 rZqsfO0ZRwzAEjW8A+ped8PlvisK65GPpMuihH3Hzq9/o404CWU8r3svfVh8Wt0cwieJXEJaZxo
 0HJ6UW70YonMF2BT6Y73FMDwo+EF2M0=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab23f94 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dEPnEWtLcj580ZCxWh4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: gAn5RqYyRSBZGT2pgU_gvu1u1mrbMIZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEyNCBTYWx0ZWRfX048t55V5qO89
 kW/VyByZT3k2KM7sh1un64dSc5l1rjD95FbBAcBGT5dQlBBu1/n9ffUsm7shI9j5NYD+pLuXx+J
 mWo1lzWgzt+Uk9Aw2rK5g+UyhGDCFs0QDEhQ3vg8WlFOTyfwBlDgxat+tBxGOZEHU5UtcOTL8ur
 MYHQ8R30x4Ym8YmCV1WNODqKFhOt9FszQCBcRiYQa8OMvubJLZQFOmexNRiiqExOL6BkO/e0tJr
 y0XgRJ7G2lfTznqyEPz78dJdcZcJUhz4AxlWal05gvTC5KEB/g+MecRfgUTgd7Wce6B1gmw6q6i
 oBdRdRVRbxuga8v4BZgnGn3A1KGoaGAJ+RJpJwd3zU1alg2mrMjPTwLdQzOZIeW1BpWj7+xRrmu
 m1RemZZjOG+x+8jgpiHFN+xwmYxEDyf0ivuXBtnUbsmxCURWgRiJ+8HkY/5IOLOaicRkiuDwWg/
 stzw121NdXHiOv5tWmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220124


On Fri, 18 Sep 2026 22:17:13 +0800, Peng Fan (OSS) wrote:
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
> 
> 

Applied, thanks!

[1/1] gpio: dln2: use assign_bit() where applicable
      https://git.kernel.org/brgl/c/b399579a8e7b2a442f456df86cafc33628da420d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
