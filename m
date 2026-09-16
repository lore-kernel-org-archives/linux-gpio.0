Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADD4457B6
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548018; cv=none; b=C15DI5VlvPJAgrsdxRXxe3hgy7gSwAJDXd0Gjm1UhRo9OnXLGoEwpor4WWgZ+aHFhPfuPBWHE9a7Ib7EOOzOnQdBdrn7Mfxlg3k4rGMMbd6oyKZZnO0Zif2pMyUN/vjnHCVAl2gFvtzUyE90aR4XtRr8AGTNwc1UFP9a4W14fWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548018; c=relaxed/simple;
	bh=V+uPST908ARcUPbXsZ044ImTTxG4hdUNF6WNYVa1khE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRKdR3Okl+r0q/npqc9BxnIZABBeTsoCZNUYCw0VdlhmjcQTxO+SdNENO9FLd7/M+KN6HAUDTKev+XBrcIqZn6t7f2PzX1DEPCZhjIT5cPrB2lzZLSUcbU1LKCEWwdnya+A1LFB2e6G3E5q8luHYxSxexfJu6ZPO4yZ7BUfH2Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzkOeRvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kczu56EZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzkOeRvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kczu56EZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G69BrJ2430275
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 08:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=; b=CzkOeRvKZ/Il1fGq
	PfgHu7bAoFRYlU1hcVGhiYp7ou5rH95zbeILnNuLzAZ0QL17PL50zJ0rRoRDmuTO
	wvwj0tQAdSLdRUmvQv4zGDY0jN+IKXAG+IGqnIJAoGuF0p+bhKkPYHZlwSiNq+1C
	lusrNWf3kL86da9h/kfq0hPAEt4OTzG1angAnV79j4oyKJteoAXN1K1L2Mn8Oo0L
	K72y0qnEVR4TMpHBh6Ic8ja2i/8zJaXnjoQMclW/F5nuBl5b+TxZdWVIKthwdv/s
	7VyO28k3JswSvm1+GusSnyaphy+uFf32epbGhoOIHhL2tPLD8lolBbckzeAUoO65
	4DQsMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfhvmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 08:40:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939c30aa9a0so488861785a.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789548015; x=1790152815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=;
        b=kczu56EZ1DKgqEDxpVsRaTfFxXcJFfj/eknvS02JjrqILwrzrry5s0KifMrTv0p+wM
         QJyVQEEh9ROOACEXFCuBhYnImVD3Ru208Lw+5nD8uPgsw4NzEs14U1JNbpBT024nX2fY
         DmRk5FuXnBGYL80XAGHtXDTkKB6RlCnGhUPwHFC6bWnxxU9C4usPUKAxpIJTF3t+Tr6C
         Wk0mMSjcb4mM0Mg983EwM4PuCXsAgrXy9WYV40MCFyuF8pWpMKe3iFZsksL8bJJKlT3T
         xo93zyQsE/oVADZ5BPMxW8NLRTFaBWg4v9xcpRRRWYaNOHzUjPfvDKcAvQhM72dtYgTI
         v8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548015; x=1790152815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=;
        b=A0w3K5Qr8aGojZlkKJbk1cCI+EWToXFZTNm/qKWxNX10sbhQcWmeuwft3AkM6K0QFd
         wBaFVzmaREpfGZ63aKKcT2+VoD0u1iBZc/ss2Svhnw9jK6C6jLVy12ELFZKfe8Hy3t6y
         emyOuy07neN/rLkPMir3jmFIgHXA1vUq0ESU4ESndJMyh89O8qURV+jk/sZehD2bO93a
         GZaa8iPcyu467hPl5gP99Wwr6EG0kF99zPVFnogRENyjw4/ajRKTsSBl8GZS5fuWBbI5
         racQxs9kOJzCExI9MK5H0aGuP4A9L19vmtjJ9ZAI+N9D8KMvfn8aJ+QNw+DuFnBL7cLU
         jz5w==
X-Forwarded-Encrypted: i=1; AKwUvBx4ZvqDDSq4hbDhSOWH0oeJH9nmkklpFbfzVb6ri/bqsJVXr72D0746t+dN3X/U6AN+ejrfVisFxUht@vger.kernel.org
X-Gm-Message-State: AFuF++lMygHHpDWrOO9/HjrrgSTsxhplt7S8mUNdpRFbHyQ0xWRpTuyG
	gHL0zvMXslgFLQspPYyVfLp7baxvpdBPI4W/WkqNqo964aj2W1gIJoepz9YOwq7WZDINspqcwiA
	2dh1wEj3fz1OMbA74VItJ7o0QXPMCrrbO6SHL5n9xtz/UTCw3RfMHQvf3mUGIIuSW
X-Gm-Gg: AYBFou14Hhob7RtnGgm+CEiOJTplyDJAMyj1E1Mwn1DnNpvfPJq1su+GqGL+VeAjdW0
	Bw9wO5dFpC1coJzdBhtB7Qhth2D21sCRlaBTdg50GmYcek6M/jZB02+ylHQPQNCZyaRYvNZFnGS
	NMdqwjIYY5RsmKWes19Q3DsnYJjxFLD1LM7MwP/OLFz94sxX66X96ygKhcPwhbUyOWoS0S+rXWA
	DfQVX8yzHe6TS7Nbo9mxwGn7vvLQgOhHSEAcrlcGN5CdC5WgHx1IEIqLv6M1wACifadUR1xqL3z
	6JFCy+l03NEE3bFCHClEngVjoIBuP6xOn7nQhCHXqONqhP2Mrzutk9QmTkiFjCIPN00LbBPcwFV
	RHL4/vA528gyiMJvk2rd0kSKGnMg=
X-Received: by 2002:a05:620a:390a:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93bb77b1c21mr246029385a.19.1789548015002;
        Wed, 16 Sep 2026 01:40:15 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93bb77b1c21mr246027385a.19.1789548014553;
        Wed, 16 Sep 2026 01:40:14 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d906d8sm73865635e9.5.2026.09.16.01.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:40:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
        Michal Simek <michal.simek@amd.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add parsing of hogs
Date: Wed, 16 Sep 2026 10:40:10 +0200
Message-ID: <178954800853.4594.8595812335240808989.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
References: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa55ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UEueuJH-RofihTD06CQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfXxxZrcQX7A7fR
 CS+IMyH0rhC2Yz5qVBiz795NF7gjuQce7jKs0iqY79QecFwPS7dI6pNx9+W36nYoh3i1YfoD5hh
 sn5qNFE8SzE7JCTeaf0eD+hfu5YFvsF21ScFrK/RHl96OOwvlUGAgA7QZNhdMkx4v0Mk8u0Yhgj
 04T5C/VtcAJx8lFZnbQXuDWQzSTheWCZ/80cqOCfOOnW/eN3efjFjjI7u/e0jh11Rxs+G1nt4Dq
 ePIPgq9HBaOZQ3/op0i3IIqGWip+6D/DLPbh0Q3aL+QxYJqoTMrgF0Bm0LhrZClcktbMZS11+oN
 xbDyrHY1VorbZ8/L/9Qoc3zpTWRqmCxuhvrX6v6GQJUgwm8Sqjh6p5eeoWPi2XqVb+L91Ptej6K
 iSTjgbBlm+xmmoKgmjK3TZvmIq2cyHNDBmXWa1IY5QUIRyvJlpwi3V8IzqEsOuNwUbSmyvwdbqV
 2CMO+5H57FVcqyzxUZw==
X-Proofpoint-GUID: tx8d9kGtV82SY1WdVhA-wOssEhDWSh-8
X-Proofpoint-ORIG-GUID: tx8d9kGtV82SY1WdVhA-wOssEhDWSh-8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfX2rdVLzKcH2Tp
 ZuDob4NHipHcUCk2PGvam1sPyB1JAVxMGyhWelQqN4T/JY/FD47/2N6xkU3eWxd9Hh9zPHb7HLS
 Ml//+z+JLHZehiNUuVGTWRl8XRcl8+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160112


On Mon, 14 Sep 2026 10:51:54 +0200, Michal Simek wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs the same way
> it is done by commit 545908a9fb9c ("dt-bindings: gpio-mmio: Support
> hogs") and commit e8f2ca6be61f ("dt-bindings: gpio: ast2400-gpio: Add
> hogs parsing").
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: zynq: Add parsing of hogs
      https://git.kernel.org/brgl/c/4bfe5b08a5912d1720689b1fc7f46c9b8641997d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
