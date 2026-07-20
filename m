Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B573E5A1E
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542514; cv=none; b=m/nH2gFKEvNte9iF6mOiPfNoKhPNTXPLT+/bF0gxp5tJD6YPdVNHLQqu1um9TzQD69tngGGoqXFXEOzgRsHW3vlsLFkgXtLxXQOkNdZ+yz0yeZrRLZ7WkyvpATZWs5KEeCRb4D57aCZkamQ7qjMqp+N97bGHPytyS8trCBupwCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542514; c=relaxed/simple;
	bh=cC/zmMj2BA27d70adCp6TV40MLwiZxOrTLBi3TyZkwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r8CN++lNQpG8SX4jqVC2ecjYW2NjhG59DCiZEZGuM65mvTTXO3+bwUNqWrs5TqWL6eD0fPz6YRQy6kxREnKO6LsgObc2wwxq7GT0InqUBOFk9N1tUE29w2rGGr8ppQNWY2rA+ZPHmcvRKgXD1brZPxcQjTXwuDZsrwvld2DrbM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWl9FDtf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrYBx3o4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWl9FDtf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrYBx3o4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vY4X1773239
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 10:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzASZJAIi+nZyqX50kjG+5tMwFSD3jcN0yYc8R+sHoQ=; b=AWl9FDtf4RJfvsGB
	B6mMGlEfvfkSHq6Cl+zOJjAKBvI4RhtELriKuJbrET8doA+hDgBqPRAlsQ4NPTbu
	K0br4iwyMFC/lo60DOsrDmq9V9YyfiJK5V40oXj5rNExPWK/DNAQ5XF1l6KdDjmR
	xt/Yn6wugVy9hd+KHlIc11ibCH2OoXXEz2pZQ/5cTbs5L1vSMSA5bO+9aJTmkX7O
	aVg+wNy60ysq/Dez8ApklyY5O1GrCF4thpz0UbsRhexVneJwBRMMRt+p2relHPbX
	0EIKolYqFoEw4YY4Q4Mz7g9vawLiGGsf4ZS+LYYDxPw89UE5uem1UxtHYzbEJL5U
	lXi0PA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs508vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 10:14:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so165484501cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784542498; x=1785147298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YzASZJAIi+nZyqX50kjG+5tMwFSD3jcN0yYc8R+sHoQ=;
        b=jrYBx3o4MxQvPMpE8UzqD8kRA6H/DzItWThJO4NOpfPXotOrWOWTBdPAelxIILEezC
         s5rLOccGbleSCUvwAxO5qmTaXlRzNnBPhSo80ZsMhM1PnZ8ay1g9/TDSWRy+Xhh7DVWS
         /c0AYmMbLhrKBSkM84AUKDtoRqkzxft9ZMQbdNzfdtvk5cCnDN5/yXNFWygTUy4meVfs
         thDQTEY4MCZQNo0zG+VWVZ2/aOCL+LwWEgzOVKhyOdKQ1450deUdLIcFJvup7Vwnl4Hn
         7PJB6WmjSvedFPEZRVuy7iUj8ptz0Ni+LuJUUB5AKRvTQAr20564E9K4iy7Ht925Wl5/
         F12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542498; x=1785147298;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzASZJAIi+nZyqX50kjG+5tMwFSD3jcN0yYc8R+sHoQ=;
        b=dQFmpuT+wFuPuNthZND+vHj5DtBsbxn1spETKleIERwmtzzeBSwd1dJnpl4/t0zc7H
         UVbF5pByEuRxsyPtsX2CzD+NJ9rM0BbOEYQBXHBfexVLY5So9MEFjFUZsvd+w4/AkK2F
         jc5Vt2a7p8A97FQvGJvP8JUGTSAN7ZhxLIOgyQEk+oNny6LDrVAuOipU8AYzJWWBZsQo
         qEJKMWzP11fuJXN09Vmas+SgFaputKOhuYwG7v5Jl3B9ZX9PU94S4ABreaYRltugWXdH
         YpS9FLGEZ5oExUO/04KgJzdbjbFgAXPs9HjrXXXO28Z2lnfreHKWj2amM/FTeopGDneJ
         razw==
X-Forwarded-Encrypted: i=1; AHgh+RqSlEufp0zVjqnZ2D7U1FJnDX6Vc65Op/W5H+PQcZTf3MXwPuysAUCGwOHJeffh/wYj+ZN3KYRZzvzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFhNzqb5Czj2OM8KeqCwC9wIRkej087qPtzjxOiSQT/FMhrh2
	Cd2Esf/jWLMi8AXUVNHygwg2r576Cs2F6xDlLJV5YQUR6pa4uXCTgiQD8PSyTalDRqefnjBE72m
	z7YMu9iNr2yixC+Kkk/0tL4lZtDy4Sjc1ZjXCJbTNnGLhLYhosyKBe0FZTCNjCn94
X-Gm-Gg: AfdE7cn5PkTridPqFuTXzfTr9Q5B4ceRzz5yDQkCobPVF8SuQVHM/bzYolfZoHdBtt8
	dGOg2Kqxt4p57lzOjE9LFn+JvIKTJjNCjP+R3axPYyWofhCtVIExfAthX2a6tCBczUW9qBvbS/F
	xPQseFpiq4HWXn2Ai/Q3mpYQIOUYvfXasvpA2g0MG2yM9VO2lOn0D1nACFpoSGLFRpGvngtwPCf
	aZ/BRnx4tP6B7VAVJ8SmwOFtqsCPLS24444O8RuCMnZeqPVGlvazLTsBIVhucQZ7dmEbJ3tF/Xh
	zBgcSE2YlsRyWiq76QgtcVBkCWUvcAow9bc0TpfO1TN+WWpiqKzLnJ8SSe/68LMTsFM0yyC29DG
	xbbs4VgZjq/p9KOvaL3NvyQ/Typ1K
X-Received: by 2002:ac8:5845:0:b0:51c:c67:2042 with SMTP id d75a77b69052e-5213e77d7a2mr130027711cf.53.1784542498149;
        Mon, 20 Jul 2026 03:14:58 -0700 (PDT)
X-Received: by 2002:ac8:5845:0:b0:51c:c67:2042 with SMTP id d75a77b69052e-5213e77d7a2mr130027431cf.53.1784542497790;
        Mon, 20 Jul 2026 03:14:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6fa848fcsm18620675f8f.0.2026.07.20.03.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:14:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5] gpio: kunit: add test cases verifying swnode devlink support
Date: Mon, 20 Jul 2026 12:14:53 +0200
Message-ID: <178454248867.23896.4781577626735793708.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260720-swnode-fw-devlink-v5-1-ec250ae6af91@oss.qualcomm.com>
References: <20260720-swnode-fw-devlink-v5-1-ec250ae6af91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExNCBTYWx0ZWRfX7rQ2H8yF9B7G
 YvgKY8mQn2Hlsd6IkAzuxyoSl/A2FuLHG/iQ/OCflrmrD+9SS8nAZ6F56f3z1SRu6Qg77/wivNu
 wG/bwag9/wrFX96oIlWkzrxJkYzG+x4=
X-Proofpoint-GUID: JmuVJxHYtOsySm7y_UvfCo9P1hzIWehu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExNCBTYWx0ZWRfX/98N4Cmupmss
 hdCBcSYUf+HApSXZjkzIpEbYQ963w/o6crARXZwNCYcBDrgRWXL/hBD2bzoM80HtRsUHFQNhIEV
 TQU83oaeOCXE3OIag89MkdXVF6vRrYwbvUlhnnklc0UMuNI3zCFAsXqrB0PRJVAZLg2opc2CUDJ
 RE91S7Fx/7TeuIZL/FBulZnf4c3XPZZMi+gSyqkiGdU7N0KGuQGWr6KMfmJYonYe7QXRT6hMXkY
 AhzKj01TLenI6S79zNCnqqVv/IwBQzwRjh0J/Kcl3G7ftcch/j7mlE1A1EL/P0B4TFZjpsOymc7
 0xaD8dQv6qhfY32LIb491wxibbrrPZtiRVRTj0bCYTCRO65V03nISVAH5xznr+LH28bzOYvp3QO
 VQEKggmevr+1ACa0G2pqH6fwsl3pVB8AoG53/PtEtBxyWTmAcekjhUcaxvOYt0bKVcKdbtCJaAo
 ZOSBgXQ6NU2Z86bSvtQ==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5df523 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=N-8F-g_hktDZAXegwvoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: JmuVJxHYtOsySm7y_UvfCo9P1hzIWehu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200114


On Mon, 20 Jul 2026 10:15:31 +0200, Bartosz Golaszewski wrote:
> The software node fw_devlink support already has its own kunit suite, but
> that verifies the fwnode links in isolation. Add GPIO tests that prove
> the ordering works in a real-life use-case: a GPIO consumer that
> references its provider via a software node.
> 
> The first suite registers the provider's software node, adds the consumer
> device first and checks that fw_devlink defers its probe until the
> provider has been added and bound. The second covers the fallback:
> with the provider's software node not yet registered no supplier link is
> created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
> and the consumer only binds once the provider shows up.
> 
> [...]

Applied, thanks!

[1/1] gpio: kunit: add test cases verifying swnode devlink support
      https://git.kernel.org/brgl/c/9672edf75bc7ba3fb5b7d529936548de38b5908e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
