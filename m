Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524426;
	b=L+kc5nOTw6hNkLf30/vBifTtBZDXGQH5gRXgAToP8F49CGA18a3Dbs/nSwQ5pX04ZqTK
	 m0tFAhWWiOetHDLDtNmXcT6IE9ZBA8LFWhDwzCEVOtY7T2b+BvceXVYfr15Af2LXvT1TH
	 O8NZ4vs/8bwOOtAjRH+HWyCNOUr8+cCEGo4sn1yRZViD0sZycHklZ+2k1MtvqXj5RYYyj
	 /xiudAhgUBVgHI6XY8amevbeJMnE/4Whzog3E2ONx+44OrQiVq0Pm0FULa9maUMU1wGZ7
	 pmFqltHW1JMMygSaP6LPHf1gwfMt2b6yCUIGv8fL7yVcFirAgme/cIK3YJaYxqefryg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jIX6CwEmiY8bIqori/Wd0NcOM3IICfbWLQzxsrQ6HbU=;
	b=NjYmmBwI1pQPqOD7ra3MJTFBeGjUJ+FmPzSKiBaOOYNhRJOxSD7DJHhAJx5t7srFp3GV
	 StrfmrzkFPEd9uBXLHG/gJzYWTSLoV5r2sYZXUXXgm11gQxjrSfyXux+9QOfPUbPIPzQT
	 YGL6W5p7fj1XMJ0fm9Y88VO71myn6FwChjwjEcP+Dw0dRhKwB9+Ayn3F0SJUOKVvBmvCh
	 RrUjtXVPZuoTFNCEu3RaUryNwgpAwlPiV9aU2qh4BcLb8rFWQy8UGjKF0++oWFUsVxyzJ
	 F5YrBRO8Lnd3n2oBBDy6pe46Z0IPSHWguPkmJYufwQwytuO2MZ4nHWFCxfO4Y96bX/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncGW22fl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BAoZjBP/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC30E606A330
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 12:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC30E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncGW22fl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAoZjBP/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAubxk1025308
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 12:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIX6CwEmiY8bIqori/Wd0NcOM3IICfbWLQzxsrQ6HbU=; b=ncGW22flIvYi3iND
	XCdk/DamqlPZO/Fqvz/S6CM+w3yvN85x3dRM3Gg8gzmIIxceeMVhSOPNAnN/Ped/
	bqzI2Q5VXPaMVb0ouTgaPxclk9vX5Nh74tadL/wO8Hl19cWiyqQ2Hwn8KchyvDHa
	WfZo9eW4q1F1bvobBac21KEmJvXq88796LCbM7Uixbv9bcHBhtr3FXSw/l7+jBny
	Yq219w1LVPCIUIFyXapFABG03JZUdEGTYostCo/ixykLoUuxc15Om9qda4RXvaAb
	CwUcVtYHN7ssxyZoZTcagQKxCXvf2Yg8BHeGdsbrTPU8VVqy0HUmq2yOkGT7pR/G
	5azjhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2r9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 12:47:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so708170085a.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 04:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795524424; x=1796129224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIX6CwEmiY8bIqori/Wd0NcOM3IICfbWLQzxsrQ6HbU=;
        b=BAoZjBP/RMU+ou9+0QjUrmNnHGhetrtF9eiqAtd+nLY74d9z+XivP6DYm40bEVVcyX
         frYk0ZSZ/MQTi6u32xlNBjMS4IW7afAOXy5k6tVDE94TmpDyTe6Du0zVQ7VdnugcL5q5
         2Ojia+5PsRGJCDBpGQHwA206G067w6/TvEIdvIwsDGVT2PwpRjOexLmQwrjYgLMfwwDj
         1QPygs9vAxYoQwfgXPAJfM4bCpT8YNuoJkDlds/OTvBMIB0dtR0ulFeAtGN0nuaicZD9
         m1r1PC+ZNTjVmYruUlEo8ErObsrrJxGvJppVRki/ybghp1PjDE/XQaLp93R749bEU5lJ
         SZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524424; x=1796129224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIX6CwEmiY8bIqori/Wd0NcOM3IICfbWLQzxsrQ6HbU=;
        b=q9SnjeDoMNtHIgd0rfwEuQpSCCVPS3JRCKfTxHPtOUaQpHEHmUxlKEDWcletHNFNmt
         YKuG36kwW+bfSzkRw+UPyzRJ3nWBUXLb/hxGY6Zeqmv+QfdlFec308c5x5nKg6XWERn3
         1Wu0USjHzm6xbj88d5PaytyT0ecBkPV4Makcb2gmraBrowNP++eLjB4UZLy10bhZj4Xf
         oVNOCIyNLGblajI/G50TE32zxJ70oRMPnSdVsxlb9ujtscatuAJ8YSdby4hlSQAOBNkn
         T1fUAQlxSh/MJikzfpU7TzLksIappubGT3hv59J1zmEpqt7Ddap4AHZmulCVqQNHPoSW
         cuFQ==
X-Forwarded-Encrypted: i=1; AL+hErEkxtFwlz71iZX+Rd0e9gG4bKrKapTktohYlnlMweXQErwRxCiyU/9inHwUDLYhKSBmfCwfkhWk4/IH@vger.kernel.org
X-Gm-Message-State: APuU4Z+uK1xfawrYgt12PWVsNeqlenRFrpp2u7Fcic7veaszKapVfc1H
	f1AlTukobSo3bZZWYbeBcmfOS+wMnKTNHEerVsHNpZyJCPqNt4AB9C+5VdNWq+yKTDLKrZ4jfjt
	9wa2FyFlpYQ7YCz1GI9iwVPTV2GpzAoAuG3wLxXJEfU4V01Y1lx1R3EQD2L9vg/Ru
X-Gm-Gg: AZFdTZd62woEIxSsLvh2YYiwotNmp3eMPKm/y7e4MmyfKm0+Jrd45hRhLF2aKv/BmqM
	hTuNhCGhlIWeI4PecwKvA9AoFlrH9CsiHbKfdLCU1bZLQEAFBKsXpzJ5xW64PotQC7BSddeL/4C
	fmVvlLMrCwA0jC3gVMsOudaWZ5d/th37hu+z5s4pnXmjtgIDvng85Y3ub5ZO/2stpr43IoCjJfh
	Xa98wwmRmjxHBSO1YEpf7L/kJnW8kHVEJksTTRVqe8VqN3nYhACBDahWrtO5aM2Eod4JwF0HyGM
	e7eTOq+CikokOVeA4KzfG+qYOK4e/6XNOs1VNaBDuVSB1w4vInvJiPmjzV5R6eMSmHmH1Ugprp7
	s9QJ5WNk38jtB4qXLOKqT+mzhJxoYe18RKQ5uh4NvmXFdvFL92zvgqHId8iFChgNtDZHsrmkos4
	Tf0G4MFdsDYixGDYA+qVzKhZE3QnoCJ9JYm9GmvqAMLYktUW7eUNSYo5GMDACQ0w==
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id af79cd13be357-949ba9e882fmr2401290485a.56.1795524424113;
        Tue, 24 Nov 2026 04:47:04 -0800 (PST)
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id af79cd13be357-949ba9e882fmr2401287085a.56.1795524423707;
        Tue, 24 Nov 2026 04:47:03 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm162284495e9.4.2026.11.24.04.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:47:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Cong Nguyen <congnt264@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Jiawen Liu <1298662399@qq.com>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: do not unprepare the debounce clock twice on probe failure
Date: Tue, 24 Nov 2026 13:47:00 +0100
Message-ID: <179552439935.17414.3815780367440771141.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124085231.3696739-1-congnt264@gmail.com>
References: <20261124085231.3696739-1-congnt264@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0OSBTYWx0ZWRfX7HCGAoLM5fWe
 kQoH0mQoJKq85tWt+x7N66eTu4EGiZGwIHV9LALXrVxxbw9acuiu3Js7La5+rGuO+7Ak6jjrRez
 NKUVBH6gU8KuBqLiMDruOSXalvxc4jY=
X-Proofpoint-GUID: D47BzHCgVkAeLu_Lq8FEbel5hUAZQhUI
X-Proofpoint-ORIG-GUID: D47BzHCgVkAeLu_Lq8FEbel5hUAZQhUI
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b058749 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lcnA47O0JUuAoBXSFRsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0OSBTYWx0ZWRfX8udJwKyahUtK
 Y5pUQKtf92gafVhe3e31Ssl+jBYL4XKy4F052UjrSHJvmJRocppgusVm2/G5sQEpQMWlAJT0D8z
 jkLMmF/bRuWecDLKHrccF9Co3n3Ubpta4r+m7Vz+DZ1eRIf1HwXB1Ajw+Cx7ZF9DlH2ifHhxhxT
 kq8g49ja+Npjmd232pL7TMb8jNgCnzzUBAfhKD+jwIsihgRS3D9cpCNlf9mSLtTLo2vLpcuOF01
 MNaVo8a+mPmDxdAhhmXYg6CUBaVvUVgQeaVRyY3rOnrcVi+QHsrdOHruLue77GwXM4hHrP216s5
 BTZw1jIYhiG1XnIpRbX85kW5QZ+Psd8DAHSyn4qWijG2FUAxgJ+uy3dqx5rU5J8ox+7nlU2ct9Q
 88Ka9G9ikyPQDZg1T6FFPj0rz9kLVF10HHpg8JHLgxMAfMeI9Sz+iNytf8eGl7X0FHhkDpNWb9H
 LhCXIRcVvFlPyyhRtiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240049


On Tue, 24 Nov 2026 15:52:31 +0700, Cong Nguyen wrote:
> The debounce clock is now obtained with devm_clk_get_prepared(), so
> devres unprepares it when probe fails or the device is unbound. The error
> path added for a failing pm_runtime_resume_and_get() still calls
> clk_unprepare() on the same clock by hand.
> 
> When pm_runtime_resume_and_get() fails and a debounce clock is present,
> the clock is unprepared twice. The second clk_unprepare() warns that the
> clock is already unprepared.
> 
> [...]

Applied, thanks!

[1/1] gpio: omap: do not unprepare the debounce clock twice on probe failure
      https://git.kernel.org/brgl/c/b43f14590a30eeefd64e1db85f08f9ecea1821d8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
