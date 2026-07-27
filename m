Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94901285CBC
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150886; cv=none; b=swP8R1dR03IN6vqT5qUPMypHXHGUm4LjlJhQvpYJ2JBHVvatXjSlqqryoULyGydI9SbpQE6o0GPk8JAKKXH19C3z3dG+aPAG2Siw52qLFYFONgVicQceJUCNMXGWlQtPr1e8cH+JXmIbY59AA2myHBX65nNrdlgwnum/eYrm8EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150886; c=relaxed/simple;
	bh=0/5MlWeGVX8FKpN9nW0LlJcjZRS/TLy8oRB0mPAZPjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EYq/yKmuaZ2oVcBy71Gs/kODqkbepD+wJNB5aHEZTn6T8mxJ14+AZh+YET2bs5/8WJehYhqQPXNB3Kl+topw7Cx36Av85ZNltkAZ6cqiK9LwzxL/3hROLFA3sBK3RuQPQo+LkuSxxhdKu0QEBFHAzGDR1SU3FM9A6IUqmcTW9yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G69/ZJ6t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kC9HErvK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G69/ZJ6t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kC9HErvK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMR4q3594232
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 11:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vPt3wVd6ODpFpZOnDJDqFq6YfT1+zBDDF66Us+huF8I=; b=G69/ZJ6tydlQrKBT
	43JacVZLFq0r2OE3cQ6r75+Gd1ivwjlJOeIBieF+pOtEiA5SdoNnR2lyepGrz7Kx
	8j0dqCEtRCOYsFdoLNCf5rlIvcM1f8DqJiZEaGdtQgnIYYR85DRGqUg78PwXg/oG
	Bb3Bn85KWgtfiDML0HrlA6N1ZDYPHisaKp0S7hEMWTCQma61kxA+RCo4FGYaj+RS
	dr26QJbbgy5KJ/54KE9Ukq/BQj+sPfDx8u2hadPmIA/NaXW+1lStsHmj2N3UStsw
	ofBdR5NuZFjqMEAJyKyOzCFI4CdyiLgCgyffY9Cx2wplihL5n+sP1q7IMUElKPa9
	u4Oj9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq0e4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 11:14:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1eb52e1fso47420841cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785150884; x=1785755684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vPt3wVd6ODpFpZOnDJDqFq6YfT1+zBDDF66Us+huF8I=;
        b=kC9HErvKtHdxkatcw6qWasGgdV9NflNXI7Wzk6pr6j17dXwOrEEnCedXHXA9Y3caNo
         LY/21r60xtX2hSmkR8vO+hVB+RG/JlA0nP2idpwuXZFaYzKsCluBNZcEuFg5ofoQUgM/
         +4GoHRlkbBpJnckp51w6/mptmqE9dgc8KBhaq03R5o/LjsM0M6RCQhJMd7Qmys2Q6NXA
         9DBecAgIAkh4UtD8HqPqxjozeNLt1xMpEdSfPdfQ6cpXMg32qCSHdeuKiLEu3s037j3t
         ClwZKbmfAZCmIkIiUgVWmRoCypLHHBosjTS/n7hG23Rls1nrloVMkNPIdLnVzFy6MQKM
         HP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150884; x=1785755684;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPt3wVd6ODpFpZOnDJDqFq6YfT1+zBDDF66Us+huF8I=;
        b=jz/R8g3hpWFzM3iejn9kCRqrgnDtJJABUbP98LEk3Cp15XQkNHwLTvZwNRC3FoYV1i
         8xG2zLugeh9lOUxKJE5B265y4Rgg/EEmD9PB1Cdzh58Lq7o+9n8HAwPPJuyJFFQB1PZA
         bdtojZWvqeMPqJEGq59VB9CqOcEhbtZeuiQwm4xxtUh08Vt7eew3WBfYYKb2BbN6YbGX
         kvlXjbKrtYWP2MKg56Ff3i/n+fsGEVjFmtxGWLh6mV9fbMtRZTd5aZcBfTqb6KZe57jC
         6ISsJNgVoc7oVhKBmHgC0apvoISNSjo6SC+70dMcmxE93O+kRyjm2FGZlwf0OoNv9mEl
         VYGA==
X-Forwarded-Encrypted: i=1; AHgh+RrMIYhzddxI/USw+xk2s9n1YwPHIHp1HoKwHRKaqlhdpcq1+kKEw7ORaAC4zDtTyYY4PwrMV5JAoiA8@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDWP1Or7+a3EaINC1WhZGyfzvN1fsrn/PwBxiRxQ2LJg0R4nm
	BD7gN03khwps9jkde9MTS2ILlAi1WZu/ZA8pRwppCUbzgK+lhphM1EdhqiKCFdcmWN5MiOr0TxO
	PuSZSu9CNaB2RZPnoYtpxR/kGkMLrVejXbRKYSKpt/pDVo1qxhHxfOon2mdrc34jp
X-Gm-Gg: AR+sD12Do4mndZhpqQ4gJQ3yscxabEHVm2WqTyzNpDcl1+ZfKn9G1Zyj8uEdGt5Est+
	YeqkOimay90pWrzMIodqk5DJWPlHk7vzNimdbsmauAwUlCXl2Fyc1g5qOW0E766FiJBVtcQhlvh
	6Pv493BEzXNx6ShBqilHds8YlOy2SuNKCEbiFS3zQbBbEc0qyBJxmY2hyi3YsDO0IX2AoQNU/tb
	FHD4O6zA6Fy64ON7yuCs6pgvxJKMC553PzQdCnLcpOWgQOhQahGlxgCYdRMKdEmM5JpUqyk6aQf
	oWH9/4pKHtmJII3he3o5kIrlfsACRx5aGBpIIwbIrcEg/PpQgrwO0Q3GPhnao57bUefIpukNAzL
	JkVS8Pz9//+BRN41px69ec1/8Nso=
X-Received: by 2002:a05:622a:1249:b0:51c:239:42da with SMTP id d75a77b69052e-529a83825f7mr81787161cf.15.1785150883888;
        Mon, 27 Jul 2026 04:14:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:51c:239:42da with SMTP id d75a77b69052e-529a83825f7mr81786891cf.15.1785150883469;
        Mon, 27 Jul 2026 04:14:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1449:2d40:6dd2:20d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a60asm51578375f8f.3.2026.07.27.04.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:14:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <error27@gmail.com>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2] gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper
Date: Mon, 27 Jul 2026 13:14:40 +0200
Message-ID: <178515087648.51358.11576417960376426909.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com>
References: <20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExMCBTYWx0ZWRfXw5NcQiSumZOd
 aldyE02BTPqVf4pmiCdjPn6zJ/Q+wonsxSqfH0CSd07uuBc3NjqBKNk+db3lXVEMT32MU6uTxol
 SqvMsdMGdo7dIVthMjYmxfqwfxP0YV4=
X-Proofpoint-ORIG-GUID: Wfy1oYHe4peLS0ZDs7gAdjAC3qpietdr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExMCBTYWx0ZWRfX066NZfAiYQZn
 mHAfE08+AuA5jEHP1t4WdB/epF4xf8QU4PRIpRNh3SZDqIcwiaasf4l0y0rzW/rNAFlbyL/1Byt
 QFVcl+ZqvLB6cTvN8iX8YSrZeClB1wHXrm40jsBpLYfgivVJOyBlAT0mdoW/g7pgTUkKz5kH2A6
 owVOKOyTS4NGnN6xEnM6+KWevhJFiSFbYoWcZ+xRwGYe3sm1uV2d50GD9lhGKmZQrkMjylxnY69
 OT9Wx3t7zNeEK1G8cFkRS2yfr/htPdlzDGTUoD1aSAWjm4/IpSbPOvnjsTnPTQQ7+W9qk5QxZkp
 EonhRGcO5osG/5AiFE4PJogvl3/MbfmMd4/VoyDSneLQGlHrBiR+06onghfc/T3Q5aXtxMPZISH
 YR5s4OwuVLH6IgHecszNLHiEuj9Y1lOqrq//wNC7+N/+swXOIhh4WIm3nfuPdadgnxG4gtqbEP9
 l6LjUJFRxasUADGRDFA==
X-Proofpoint-GUID: Wfy1oYHe4peLS0ZDs7gAdjAC3qpietdr
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a673da4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ja-oyO8pF0z1exoHtvcA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270110


On Fri, 24 Jul 2026 09:42:28 -0700, Alex Tran wrote:
> After successfully configuring gpio pin as output, set the
> requested initial output value via the existing gpio set
> wrapper, so that the pin is not left at its previous level.
> 
> 

Applied, thanks!

[1/1] gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper
      https://git.kernel.org/brgl/c/67ff4bf723c8bd1f1b10450fa3e8f55762418104

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
