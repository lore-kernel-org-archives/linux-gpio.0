Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612770;
	b=4g8fYFU07ktfIeDh6/PWkoFu991gBTO5h68Y/3YjHUT0r7MFhNX0XPBJM1Et1dY89niH
	 iY09pcLIzdsQ5hniQswxT6oxWNRL5Pjy7tLkCqYaD2EBsrEC5lpaptTJG06s5Tw0Wv3n1
	 rk+Ia4FSCoZ0t6RzyhtTpGtUHSIXZ4Yg3IW189WnMNqvYr+p0A3t/e9UmqlvZzQ2IIdUj
	 vFXHFDe2J5eZg2R/eM5wpGw1GZLjXcn473QnFtxMk5sdvnxREuwE5LjCSWcMaI/DL1D2I
	 KeAmPJbup2ASleOeFvJhjJgO84Y+QcrwvLK4bXLB1cTQ4WkP/63Zz87HEK6+hVDvdNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=;
	b=hO5rID3cI7Fe4dqapfC1iqV2/j9UNBS9MZPCBJaDMaIC8tOoR0lKkTQ3Za0nvbcoq8ha
	 +y7tGqbmfVfJD4sdvKUkXsgf/Wq4jkxfXkZjjSzEFP1FxLEtmGdWOj5oobhG6uADgnJoo
	 ErJH+dc23NxKqJHRpAelD/o8uLuln7syTww6j+vGJL449TUXlFOba1ich2GrdINybyqwc
	 qIs5S5qUzPnuUxTYZ5dLcwLEBGzdHajv4gY4yzKnI4LuaCeYpynf4k08WTi4EC7VS7Bnx
	 +TH2SGXraUhR1Dc1dQcB6IwFwHXVnhiBJAqaDMGERndWr+yl/ANL3fGNOfZjmOHEYrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owDRMdGu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NX+6oWsq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC06606A327
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 09:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC06606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owDRMdGu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NX+6oWsq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ASGP3440486
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 09:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=; b=owDRMdGu2X00wq66
	OscTnQEr4bqM26fXQ7MQ6rYmVf/omdZil/bIaRuei0bUh0bFszq4NJeOAu85Hb82
	7wn7iv6k0lCOrK9+nHdE1n+5YOZ4K14ypx07jdCV2UWixMgxK7O/cV1U9ZAHR+9d
	L7oT/C6Wx7C7JTL4caXqyPIOzo6+ezqm+O7tQGUPzTxyGFOr77DVQZo6qw4dONFA
	0MiL/5FqIXTOahivqPZVTEowxODd0/FYd+et7HKMHJKpf2egqvZbvB4rNPT+J3rZ
	Y/HddhsdxuvgxcLIXyUrYVyB5jb8sPSsCXTZUYeOr1P2uyof3kZYIQFVKJTeaFPh
	VkKbEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201qq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 09:46:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso451397985a.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 01:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612768; x=1794217568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=;
        b=NX+6oWsqBamgutEU5FNd2oC7W+b+m7KGaGXqGvAvpYfIZuMNhXOv/raDfB9pCE1Obk
         Wmvgqj4gRo751NkHv7iedPS8WkdSFDHAtnVO3C5v6R2mnrGFUq3eLWzyZVOPejMkf0Wf
         PgDfLYaJ+x2MOFQKfCoK5thuylvB7OiBHn1zaHKYFBAOQ/ALXqqAtKPweeDhBG3vkx8W
         0KUXOaboowSMxhPG3Qi31AjS/G5k+Zd2c/NqDWYSr4owXLp0VqRaPimLKB4AV8PK0kEE
         yKt70XnZ2+5HhB6Uxc/9PBCEVlDHIHb04rFQ6vhloObJRnQ8KbB1/ADfbgcuk77MdTaA
         xRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612768; x=1794217568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2obv3pWTVyIZ3QoH1rx2goFUTFBpKLGs766FBuOIgU=;
        b=FugAcWCZ+SHegNaVyJHvVcgi75zrPXj3ixJRTQjfpVG/eDRLI3dQ+MxLuZx6wrurzC
         BpPZ4b4I+V9mPZ5hxu8KHOafTEmzV8I/4bYY5OWyRvpYrLuP12cnm66nZJOYrWoBatIf
         6oB/cgjhFTa29XKzJgP0lSL+nDYCnYkSoxngkwYARF833ETNSN0B9cUdyajCBSwOvrKu
         jPa9qjSt/yqsxF+vmCTTzw0xypXd3d6uV4jDue5YHerkQGSaOQ3hdzYHsmasYtAaygeN
         PJbHZn9jwoXsxKrLUGpFgjjbOGs4bJIMjYmf3LLjgMYqyvdzkPId76nUAhINwFHc2MRE
         iiJw==
X-Forwarded-Encrypted: i=1; AKwUvBwOJZP4DY/7/CSHZQbw/igvbjeb3OyZnMW6F6qG1Yhbj4O4iDdroR59pSoPmyxZo/yb8AGY7JwpPEzM@vger.kernel.org
X-Gm-Message-State: AFq9FYLqMRRUPVRN/PTmuErdi2xMtDtlokzlngwJyrOyvbtqPB85MZ+b
	oBGpYJ78S2hWqWdwyk7kspvMkPwWn7aw4T+uKCohQeo9DqRj5+O3qme+5Tw+NPJl3TZK8lohuLd
	ZCJ2sMkrhfQjnGkgVy4LaRiQYT/XEiGRaPk5rfIToQq7/JEbZ2kRb7Y8M+/Zb5hbBj2N0wxbW
X-Gm-Gg: AYBFou2+b9AZIOL/vMpJwCIHiZXU2bEbkMMRFu42nLP5q+XeJ8B8HmF2yaIYW1OEkvj
	eF/zFxhq+WjrFMiebmMqm1Gk50+C55+fBRYh+iBJQ4Pxh64NMK2BewPfd4N499EwKjWkJyrARSu
	sLu1x8KmTwTMfFeLBfMyutawicwNP9+SGiyuULBhOPo1BlpEVQgjl9DsSIQUluQcjzqp29+D9Hx
	cmJvfdKXLAfiEHP3b+Izd62wZlYHtdzVo5DEOOj8pYTfW8I3bnPXnXdkMvsu5rBaEELNQdkLT31
	FgYMIqncRXQf3l13u/6z4dSKOi+fuyvDXMYzaqJqln+71ecKGmmIr60101hq/RzjkpxkhDbhR3S
	Iz2ooqbtXA0J4zmaKbmC2MBo7qFaxX5Raj6+x+Lb3lqJzfff6+zXTQEL+xV9T+3QxB2YGNZy4fC
	yU
X-Received: by 2002:a05:620a:8007:b0:93e:9792:fd47 with SMTP id af79cd13be357-94421585e39mr1365608685a.4.1793612767739;
        Mon, 02 Nov 2026 01:46:07 -0800 (PST)
X-Received: by 2002:a05:620a:8007:b0:93e:9792:fd47 with SMTP id af79cd13be357-94421585e39mr1365607085a.4.1793612767277;
        Mon, 02 Nov 2026 01:46:07 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm376852435e9.11.2026.11.02.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:46:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] gpio: shared-proxy: Fix line accounting
Date: Mon,  2 Nov 2026 10:46:04 +0100
Message-ID: <179361268795.50408.17291730393794420636.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cMTRrCQLr66Z1utLgGd9wnCasSjVNnMB
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae85be0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=94EpPfmSQ0WW5oeumFEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: cMTRrCQLr66Z1utLgGd9wnCasSjVNnMB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX4WMdtdLjrgMr
 3pBXLANzbJx2Blg1VfHFLwCCZeybrHDjqCDSpzEdQQKqoatNBmqoNHIDZ6X5Hc8m300w0AmZpM9
 gQHud0qN5r7hUR5h6vpErVLmf2aa/CzxpiP7LUsQrNdvOaIzQPpSxeCq1MaRsOnPfNfbgYORvdc
 cN4cxDXrFdp2FhCB8REF1Clztfva3BKOMa30Hya42vBNBFgHw4hk5dYdSXdUb4aO1OlUS+NP6/C
 utFSGoWgs2vmIgBNdEcL5hgRQ9RGENPyUvR+SGEQnWu+1dsQHKpjQizftMMPCtYaGEd5jfDSUx2
 z4pST7WQ2iaoWvKqw+mG8si2B/hqA0C5Yfjvt+JOh49Bk/TnylkYyCniY4eLJJY0CBkhzP8YJ8a
 ypnh2HNpq2xuERaG2enDZePMVaDzAKPkJNiNtd6cCdEColWvLhUy1SfIWgng5IWWe3OUJ3iX+uq
 XU5JwZ5IDfcIwm/Ynmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX7Mb2jG/cWz6N
 Z80WeODx7s2nneLF3xV8sxCsy6M/9GweLlptY67EfEKEwb9R6EX4yVjQ7C5e6+PVBsT7u6l0bGl
 nSidcegD/ulrjE8iHCa4pfMXuwY1Z/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038


On Wed, 28 Oct 2026 20:34:44 +0800, Shawn Guo wrote:
> Four fixes for how the shared GPIO proxy accounts for users and
> votes.
> 
> Patch 1 fixes a race between consumers that request a shared line
> concurrently. Each of them sees usecnt > 1, assumes another user has
> already configured the line, and fails with -EPERM. On Nord RRD this
> intermittently leaves both DAC supply regulators without their enable
> GPIO.
> 
> [...]

Applied, thanks!

[1/4] gpio: shared-proxy: Fix race between concurrent first users
      https://git.kernel.org/brgl/c/eb70d2419e79b6720fd465b905a2dddd751f2a48
[2/4] gpio: shared-proxy: Drop the vote of a released proxy on write failure
      https://git.kernel.org/brgl/c/53b7b1201964f6f147fa0fa2f61194403a65cdf0
[3/4] gpio: shared-proxy: Drive the default value when no votes are cast
      https://git.kernel.org/brgl/c/0bc45604403176722e634e670f5e38de0aa42a9b
[4/4] gpio: shared-proxy: Drop the vote when switching to input
      https://git.kernel.org/brgl/c/925409db963dbae4628d522bc6b14985e749c08b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
