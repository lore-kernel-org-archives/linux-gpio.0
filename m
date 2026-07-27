Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98B43FE64E
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157126; cv=none; b=Hynhi94X31u/QP7gy4AYpNHrRwdVe1hlaDJPI9fBy1YGfj+FiHTSa2aiZZ3tiQO1bFRNLQDvvZ9H7wMvjMkDxXHnOqLTQsjLgMr8rRINn7tP6h3bhQ2a9K3/27tz4Ph5aPkhg1LSHwLfRHiv6oHdwRSljY59SUUADlIfGLrNPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157126; c=relaxed/simple;
	bh=Bzwyki+7l+bqZEnRAo0HLamKrs7BWN4gflmVlTEqGTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJf1yx8iyri1ZXRVzY4PBeuExlKNJy+n8QCDrJJHkG2XNTvmIsS/b0kssyeanvPS6FvDWqvcBQ3VUsOUsCOqrawPfocsoBQbbYb0ebZ2mrrunxIzZrHGIk55q2+oRvipvOd/jzgcHa0uKL3SoZihYM6NcCpo74lL82WqQ96tHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kg82vcxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9W5C8Aj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kg82vcxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9W5C8Aj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMRBq3594250
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 12:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQMwWXTw4wKW415B7tw8uPLrjsQ4NQHn5F8w3+9zPsc=; b=kg82vcxnV3InbanP
	uMQA4Iy3epO3OXTtCqXsgX8xjwVu1UE5CJuAQTIkn9YpGeN8mwHhoasblVwv+K6p
	zwZ/7EuAVSYrGNTX8TmOMF/CYPEpkXaK8kVi6gPMSb0zLw7JLdoVlvX67Vx5GlYg
	Xh+umblQgO5yVFnzNngwKniGSsWWli2nAAe206MamWrqrEJnE5PDs38PIkTllPHs
	vD9wp2UGVpih67t2kqCCzbyVHZKfbIRodYj/Dlj/gDmDqoIjVb3FpVu8gw7bLNQN
	GMGh6neNRPTCX7OhrfuGvLuZp8VS8gSpfoO8QqXGRdpyDSaDSGb5TF4/cx2DikSX
	NtxFcw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq0sbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 12:58:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so40483581cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785157121; x=1785761921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mQMwWXTw4wKW415B7tw8uPLrjsQ4NQHn5F8w3+9zPsc=;
        b=e9W5C8AjVI3qZSnqGc8wPXLc56v1ICv/bPsaFz+Xv6batZjfrZXUxzSQwA6QOOY+Kr
         IoK2QgHEmwAJbJknq61no4YxAChWLaCalmHXl6rMS23T3E9Bmw5U/l59MTrarsfXBGZZ
         FpW++v9YVDtnc/zuwlsbcjuo71en5ECg9wOAu5X4vWOM/qn3y9TZcAeixL7hDhOVi1tc
         kkemifgUw8HO5Zpr7l0R8qsF1D+V74UCXmnI6XY+DFiKuL4yGsLhbythBJRSCbDKRPIk
         OSjteAhodK+/KUkCeQmFNeRKuCxJtgKkp9jJFJMqNZJL9Vr/y2DXkVw6hYVeLwhhPQ93
         s7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157121; x=1785761921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQMwWXTw4wKW415B7tw8uPLrjsQ4NQHn5F8w3+9zPsc=;
        b=Opt0CzAuzb+lBTmVeAmtcmPviabp7n+JwPDAQLRNQSh+L2GDaV9TBYR51styyuxiJs
         rdxDgE0w1SAkAc0nRZDvMCMyWVRhsc5B3s1ssj5wBxAp4kPFfo0ToApsbnUZKhii/5ku
         HqY5GFhaSp9VcOsDN2LKSgBGdlIWe9EIUJS7+7FfdFjGzbkZ2E8Hc0bWWxIIWk9HkM00
         9DjoroIuCdy/srhH3I6yQFCtgwsVg9cHB2x1KZR/H2A0Eyz8sTK9d01tFNunr7nGqGnY
         bAfRPpa/v4+1bdJsfq+V8rDY5koGgZvVDDQvHJbeEimlVOWWirj/mYV8bWANoXEqJKUz
         0Ubg==
X-Forwarded-Encrypted: i=1; AHgh+RqR1KHCy2S5ThWMCpft0xXL/MMB+Ume3MhcvakUYVL20w1OBjK0I0D5MahL6CXqvExO2rQ+Wr3XlAPO@vger.kernel.org
X-Gm-Message-State: AOJu0YzFi2OP7O1Iey0atGsCRVwjzWYl7AQ9/ha8gYO3S7UOANMt1xxP
	w+jc5FHfUuq+w+BzMozyLjjv8B0bRuyPG/QSgxYzpn745Au9uc3z9kZaeAW6gHtQxeqwrUoekK0
	OjtMCpu5+AEooZsm/sR4aA9IXtYCz+CIiL8yuuiXZgVXm2foF4fwZC5doMDuInabe
X-Gm-Gg: AR+sD12jMVFvpZZojp91Suz/ijuZQWFjJdbtl8of9qQhXJUadV6aaGMrDOvMVk0kMHI
	p8WlWAApTP8fvrRt3KuR9XHxSPF/NHOkxIZuogsCziClWteUULx89NgWzdHGnu8g1km81cyJQit
	9eQhof1dyV3Nxh72zO7wYPWbRHCAQ5+PEt9DPb1dCGqAgW2L1OxX8d/fbG5RXUB+R8JCV1UYkr2
	Vj11jiXdfs1LXTW9lSKqoIbmKHUMgWvzuiSLPjxPcrDnk9B0kiS1Z4qp+Aorn9i7ZoTlEx2ToOC
	uYSLovqC8S4J+d466vTlJUHEG1eRxKxI0jpB8JWJXFozee43oYV1RLFrP1bNumz3zuM7uFaR/hB
	UD0KdDndpE10f7hoZQbqa1bg/4Ho=
X-Received: by 2002:a05:622a:2995:b0:51c:1ec5:d00 with SMTP id d75a77b69052e-529a86aca2amr79190831cf.44.1785157121074;
        Mon, 27 Jul 2026 05:58:41 -0700 (PDT)
X-Received: by 2002:a05:622a:2995:b0:51c:1ec5:d00 with SMTP id d75a77b69052e-529a86aca2amr79190471cf.44.1785157120433;
        Mon, 27 Jul 2026 05:58:40 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1449:2d40:6dd2:20d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b49a6e17sm214676795e9.13.2026.07.27.05.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:58:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-gpio@vger.kernel.org, phucduc.bui@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: pca953x: fix cache_only and IRQ state on restore_context() failure
Date: Mon, 27 Jul 2026 14:58:37 +0200
Message-ID: <178515709857.54429.8407222473989334213.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727080205.16353-1-phucduc.bui@gmail.com>
References: <20260727080205.16353-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNiBTYWx0ZWRfXzhoBmsLzEpWO
 XbDwGtvaXHRP/qgUdfoUzmc3doi+1fkR6MMSlVqDsOGuj/aNLdm0Kc1EupdyWQPVQ9XNdzqvbzg
 GnTD+8x5J2K2UMdxn/kGfLKHQdvgJe4=
X-Proofpoint-ORIG-GUID: yxDqnPVTw4MxaJ-wymdebYNJKb4QSs_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNiBTYWx0ZWRfXxk7oL5HB3X0c
 h6x/ihHW0UJiLcJAnsrHEsflx5mNSAoO9LuiN4pWvTji6I7Q5cZ+rRqrp8wlhBCshSQ8omErW5X
 hRLT4zQ4zygV1FqXWP5Ylv+1xGNjAFGD1SnZWyNDic839RxiNhmoiU3ikHjvu9YxOjx8qpnKnr+
 EyCwlzrSEwhIbq58vW1valot0hnc6Mr+Zu64HeXaMotfAe3nkcGiZjry4yUF4Ab8e2U0MCTLQNu
 i49oMKt7p6v/MlytvkCCPSMLraae4oRzG3l+JrOrFmKhZNpWiQSNu7D5VSAwRQTlyM0O8RoKKSQ
 6UrBZRIxGqauJ4Z0A1iMOQkt7cK7LnCkDCDiOVrRr7ZURCJGkuCvOMUk214M5elltNOVTPYPKVL
 ygX7LPuGRJCPcql/pVs13UVfiztK1fbMX89hxC1raDbe2cG2IvgEI7Gv310QQf9hv7Phk+dYY5w
 m3w0NhZgxNXQsGJMCbQ==
X-Proofpoint-GUID: yxDqnPVTw4MxaJ-wymdebYNJKb4QSs_X
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a675601 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BYoRrCutAu2pXzHchlUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270126


On Mon, 27 Jul 2026 15:02:05 +0700, phucduc.bui@gmail.com wrote:
> When pca953x_restore_context() fails, cache_only is left disabled and
> the IRQ left enabled, even though register synchronization may not have
> completed successfully. Restore cache_only and disable the IRQ again on
> failure, matching the state set by pca953x_save_context().
> 
> 

Applied, thanks!

[1/1] gpio: pca953x: fix cache_only and IRQ state on restore_context() failure
      https://git.kernel.org/brgl/c/c7e781391bbf42ad6fbfda1caa66cf8a5a2aa7bc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
