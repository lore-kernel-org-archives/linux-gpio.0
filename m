Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4137946983F
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582467; cv=none; b=eGSQVEWpk6vSnUQcKedtYZWWMJ6M/JHoUhaFwKvsn/q5DHOJD4hNBfK+ghE8/BANkoF6zhCmcLdHSg1PMuwnPV+072zbxpjlLNuz2MRqg9Zrn+RghwkqaXqaO+6YU+v5sU/htGVKVtgHJMt7gZZx0XZwHIHebyeUWjnsdR8e1K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582467; c=relaxed/simple;
	bh=i1RkX9i1iRtQ2VWfQNnLkmlPXn94Ii0H1XjkRMY0ksM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zipkbmmk33I8IdEyiGZyxx3qRfx9FrOOq/vfjoKoEyzdG4/Dl9aay2HND4sECv470iuVURAjqb2iWE0ZkY44fs9TJFL8y/nv4CAogN8+xym/s7P1pusUVO4jQtsJeicpOw5gQZEphJWjlkrcUQh2Z9L+iNReXs6dISVj43mEsHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/crFFPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFxOitWq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/crFFPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFxOitWq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xZxu1871349
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajH9OdCc+QABu9cCDHmiof6wezBxZ8hmeJbrSch/moQ=; b=i/crFFPiUf+W6Tow
	TFQ8A/FnF/v3Gnd/kTiDaXnKeWf8SCq3S+2VIaCS1asipZmlggt9YpggK/iLMlP1
	QAF1K3WGrRUMdus8x6MvjlDm5LchfIYiJcYT4bsBAp4o1IRYLIAw6IbNw6Cv+i/r
	Opi/HzXtkLsQAVIRG5MNi5R2YZ8vqTpLInRY2L67dFO9L8S4kCQfWq8c1Mh/SsR9
	/qDYROzRDsBYdttW27mEJGTMh4Sy1scFLBXxnwyX8yQoYZu9NdOLOVPl9SXfNCqa
	5vLyOxkaHhO0rTaGkRdGUqpke24dVGtk1lW2OGWXNDdFqyExFUP2qvaCsXBhciLb
	twNIUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubghfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:01:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so714913785a.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582461; x=1791187261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ajH9OdCc+QABu9cCDHmiof6wezBxZ8hmeJbrSch/moQ=;
        b=cFxOitWqpO8XULqlbfcI9jp7TaLmw00dQxtHBhMBXmgaTa7v9g/YRfi4kh0dLAp8Mw
         8vZd0etTbOs83zQ+536sK8cl90LseEMjmKazSohUDDgMnbMOXtziCcUWDeTp/KuPK3xR
         6Faz9dKdtnvXxpU05kgRLlAqO5PXrIdmTrMcsWe35w1+dEz2kSwLgs9HBtSlF4z28G3x
         5XXP5x4Mj6Ibpl8UI6qyjh+SzoNH2ggUB6K4wKoO5/kUwYdCgArA2u2y4xbrAR9ZK2Dk
         j5BXXEvby++tIIhD+gz79xRHY3DxYLE0TiTHECWyzKPLw4qe4tiHXItYzz3OuFl126ui
         6+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582461; x=1791187261;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajH9OdCc+QABu9cCDHmiof6wezBxZ8hmeJbrSch/moQ=;
        b=UdSBIYE89oYPFnYz3h7RzMcPexAzcT4uQBwcM0CgNpTiAMvstLcPNs3t+Tk6dB3Vk2
         BRIqT1Io+S+1jzQzBAlq/LXEhy5cl20TMxS+XIW3JRxccUlqa/zApU2pC8uPMgrFBuxX
         FPVSNlMfZthP+d6aAPwBdek0r7F3rF0sdMcfbYar2g31vwjDYhFLblUH+quOMj0ckQq0
         zBvOGoixAven/buv45xBxNfcVqNAboFeLOWREioRHpwJllAdz+3eXCCUqfgvlTfBIORu
         3NWsiq35yz6DUHjgXz9I0Vj5bC0sgDGKEnDukX4PLgpFE9OvH69YiqG+byGmPE3nSh5k
         gKQw==
X-Gm-Message-State: AFuF++mHSy9gbWEHVakmjO0VyCZ6JgiHAtMH1HMeC45IAtYv+QX6/zC2
	I43zZapWjXmKC7UNsIIaVmZs1LOZk029t3aJbr+2U3rtthXywPUMKMJ097iMdUs/TeBk2DjJCt3
	VOA5l8cxgpRVum3l/C+b9wvcwKwUWnRwXci8GWbwmyrEPUaWoFkR8rIoh0zylWat6
X-Gm-Gg: AYBFou2GHBTTqKO7U7lTea5/JObBateWiNGuWK6kg3T0g00PeOD775+pQgOmLoHNoBn
	g+QnkyexaND42bX9g2e0zMT6PLyAGqySRg36ISp5oc5HV2pxmg16/FbCxMTNdoFaSqA3/dbunxV
	N8TSXeonHKJ8I5ZWkJPQRee708talQnQlcjjtHqMzVB9K2S+p3cIm4LpGA/ck32NEuHsaDcivZG
	AKWDwgFJYTLbGY9JSQEoEI5ndRSlqngRcpA8AX+rWx3e/MSKUZ0smD4jmz/GOyxNTYmd+cfEPq2
	CrR57PGrcXoWCnt/oIwuZMri7MyidKLV6E8SfeZO7gPs5GHhexv8FiyDQE4kl/3q7ZfxefFMiII
	mkoOhhvH+1EiAN1CZ9ykqdVXbaFg=
X-Received: by 2002:a05:620a:a0db:20b0:939:2d94:667c with SMTP id af79cd13be357-93c43c8b511mr1333663685a.21.1790582460667;
        Mon, 28 Sep 2026 01:01:00 -0700 (PDT)
X-Received: by 2002:a05:620a:a0db:20b0:939:2d94:667c with SMTP id af79cd13be357-93c43c8b511mr1333658285a.21.1790582460140;
        Mon, 28 Sep 2026 01:01:00 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d5f4:8a0a:ffd4:396a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm26601359f8f.1.2026.09.28.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:00:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mark Jonas <mark.jonas@de.bosch.com>,
        Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH libgpiod] dbus: fix the license of gpiodbus.h
Date: Mon, 28 Sep 2026 10:00:56 +0200
Message-ID: <179058245076.5821.14047767617463080233.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925-libgpiodbus-license-v1-1-d7ddafca8872@oss.qualcomm.com>
References: <20260925-libgpiodbus-license-v1-1-d7ddafca8872@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8iBAXGbNFhYtZ6fnptiwy-1nPtyKfmPj
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba1ebd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1sa7GgGcdr32qAqf3VAA:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8iBAXGbNFhYtZ6fnptiwy-1nPtyKfmPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX0DdlXp31a1k6
 25iFS7ZTj/DRRxNEjtzc3AYej2/ruAhipuw3e0nKdfDYSIyvOJ11+rCtp3xSlFSDIgMiNfrz3KX
 hrbVfnLEnP4qgyEwAearjFYp+yfgJm+KIPjlx9vxVMy6VZ8hmgdX3qmJCGpDJ8t9k/+b+4MiAtG
 uXBd0B0d6QRWVwedE0UxOAjS1R8r2tz7lfBhY14ffBeQ/yz6iutYP9uJezykNhrETPzKEijaSmo
 yxvcDVZCSmRW5xkIwrHmBAlQhog3XemsH/5uEn4tW+5mKcgIwBZLYmqdyQgtxA5b09Qp5vhULD2
 H5MZVOL80G2UTQfOdO641upJML68xnR9SSrspHps+YTp+FEnW9vJXfZRerHtDZx6dPg+YvDPW8S
 Y7Q0/P5gr1EpaLSGVWOvcZK92nFoH22J06DnQ63uudRC2dRazZvCzNGTdvhOyhlPzxvHKSJE913
 oXQxKIl+gWTDjE7a4jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX65Id0M2/rIfV
 rIREVX+wbUDXAFj0Jye8rwWchlOnayKuhXMkkfguezfWPqKkwjJoUuJzNivtL/ef8/JqSuP5Jdy
 Zp2ikSBhP8YPYi06frjHRbkmvCRELzU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280031


On Fri, 25 Sep 2026 16:09:40 +0200, Bartosz Golaszewski wrote:
> The libgpiodbus library - which is entirely automatically generated with
> gdbus-codegen - was meant to be available under LGPLv2.1 like all the
> other shared libraries in this project. Change the SPDX tag in that
> file to LGPL-2.1-or-later.
> 
> 

Applied, thanks!

[1/1] dbus: fix the license of gpiodbus.h
      https://git.kernel.org/brgl/c/668a0efe918f9a763406239615175f759a6835f9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
