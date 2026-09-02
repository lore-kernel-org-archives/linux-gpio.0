Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A344AB9E
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345052; cv=none; b=Pl4VMauRCy4MfzxYW2YmuieJ4brrEPJbCIrxGP++nCq5+KsLttpRqonvt9TkSfJArRYbKaXI+I//zsiTEPYXGt631+8qfsj6hWliACOPRqc/4clgs2Y96mzeN2KistioJmtYOQXnfJ/xhWnFqGEimj0W9DDK39n5+o8VX3KTgPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345052; c=relaxed/simple;
	bh=8MR0+dRHyXM7mT3ooR+6EESjBzW9WOnGSv5H8d47RhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OixnOl0yZ5c85jkKkOenB2yTDGZtyTrHvOzLrhmNotqscE1Uco/tynQ7k3nFZ2ssISE2tZHEy6y5OluzRUdvMsiQGvfCD4yM3PMvuankStTfqjzUcc8UBF5RJW3NvymRXLRs8UtahVxVVOKyYBaSn1IQuTsr6oMoNaru42g9jRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSIQjY94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JU/z4HJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSIQjY94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JU/z4HJb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NDBL463851
	for <linux-gpio@vger.kernel.org>; Wed, 2 Sep 2026 10:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HARNeVclzvscKuULqsNvnK/vJHjZ0V5cPXfo7RY9dWk=; b=fSIQjY943fc+Nt1E
	vvugyaC7Wx105pN0PrilSMKMP4dZmZhwfjgQyP4HUZJLlgk023gmWm8JNYTg9GGF
	+F/Ui1Ooyrqua/zJ+tgKdeTE89EIXMsTY4wo5hNnO2mlX9j82RiINyTrNTc33bA8
	eTAHCVcSa3HzWHQiUQXoNMrUbebyppLSIOj7YHePf/0318fHZG6zitVHj6oHoara
	IUnPZNwRe/7FK89DD3pqiLHtw9tZvFSNf1cUvVe0xGHMCEEN4A8EQQCmUI68aJAO
	dj1606VFdUD0YBpE+7TAM8GhUK5VKdzaQ9DJLgB10YiufUBSCimCpmEeIV5JZpCk
	f+7rVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k3f8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 10:30:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so171800285a.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345045; x=1788949845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HARNeVclzvscKuULqsNvnK/vJHjZ0V5cPXfo7RY9dWk=;
        b=JU/z4HJbLqKRKHs9ioyKXu/P706BVed7zbQgqroBnJPBMwbIPl7AEZ7tQnRPkrVZ6d
         SrVKGOlxmhJnQzMF+Jy6aawbGAEoM/ydxa6QegGDQtHzelgOqio/mwFToBB8kcZXV6aV
         OEHqVcPyzSh6NrmfeARVzCvt+b3RteUP+oz0l94omB7y4faalrKuW3rS3bAFhqFi1rIW
         LSNpyTSrnECj+YK8fe7lQV64e7Pd9sP3NcW/cRHpOy0g3t5GiLxjfaTIYQvVm2Dnf/jF
         Sv8Pe2T+5661CeTSx6eDICxdeWsDy0eBfXxce/cMxpL5i2FttlZFcSmiQ7SQdZBe2UgK
         NulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345045; x=1788949845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HARNeVclzvscKuULqsNvnK/vJHjZ0V5cPXfo7RY9dWk=;
        b=jXPy9vtKZ47zbiH9uL6ZvCcFnaTSAQy2Z1wCI2YITB2vDp0NlZAUfOQhMroDZeiVbH
         Kip9Y0yhq7t3r0E0cIiOJxXOEyZOl1BCxyvawo2fOqDBjjqsQW3E61diH1CvBi4SBqmM
         r+fE8XPZg9Zs0SdMZsqYlBQTgONk5ZvPLKWP1hxUK1yCBQkzthXuK7TwxD4awHUIIyBl
         zCFGEQlOsVo20ee7iydtIrRrLcMQ6MFLayDKfzuAFXWT4H3I/0sW56MFxZI9XfODtsAa
         NrwcO4pNGOCCcTvYGs9jkgufi1vV7oqifbps4nnmFaAf0zevFvOPp1Wkr6J3gq0Kv1xi
         +4vw==
X-Forwarded-Encrypted: i=1; AHgh+RqXdx3QNRa5sxob1giWVY8pnue2ya4iIuUyDhHDnEEzNVI23+hTtVSAQqEfpb7Deman+w05yEAaLqGk@vger.kernel.org
X-Gm-Message-State: AFuF++mP6/2znlNKWYmCbvvkOYPZcBz4DF4nlYkMgBQniyCi4kAL/yz7
	n+YaLb9qp1cpzkvJ9NBnHVZtU63XDt+VMV7rds4VukJAOnfpHC7fsfjQHHaSncYeRSABjwTNHeo
	n8ViGR4XvNgJrdJp04hg0aQLNAuTRhZdushjmaYDQ4ej1kelR43+zCWNqB2UYITtv
X-Gm-Gg: AR+sD13ZRWQ6gwD7HHlkW2oq07bYptwQ2rvWXiz+2F/nV+4AdmEGxTB3FoFosrlSDr9
	Cmtg2NDsfj9IvHvS8Fib9FT3KwoC2xOF3QwFc4wOohqG16DHN7MhBLKeOBAdmjIP30CNDYlRA3T
	/KkrHrvQ4N6PXTGDmLeG5jB4FPuqckgCLPufHyrG2SeQbCFnGEgJcoDVzdaX7WyPYMh2uBE6Z2w
	dCNCMDCKqKnO0MhsBUeYkukgkeMOqdEsVPv8OxCgEFr9XHyJT3SECasDMg4EccDOLyK7d8galSK
	K//bwImonJOESERyqGk4pV5xse/tkym3dXdeBsZ//ojC/XaCoQ+QHDKsskNtb2k370ArfwIsgkh
	D0AiXsFdw153hyvT2WLUglE/Riu8=
X-Received: by 2002:a05:620a:8fca:b0:937:2c3a:4b70 with SMTP id af79cd13be357-93960fa64f9mr269710285a.32.1788345044762;
        Wed, 02 Sep 2026 03:30:44 -0700 (PDT)
X-Received: by 2002:a05:620a:8fca:b0:937:2c3a:4b70 with SMTP id af79cd13be357-93960fa64f9mr269703485a.32.1788345044243;
        Wed, 02 Sep 2026 03:30:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm5667434f8f.24.2026.09.02.03.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:30:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thierry Reding <treding@nvidia.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: tegra186: Add support for Tegra268
Date: Wed,  2 Sep 2026 12:30:40 +0200
Message-ID: <178834503625.13814.18008045740177349445.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
References: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX57r5H0S8h3vz
 dRu17rXrYE5tcvQb4k13qSdQuNFJunjG9gMRMH6mr3pQus7f349y3q5cNHNkcUKNvdV2MyFKU7G
 ZFzI9EAg2uWdQqguT4DUUjWVl5wHUoVLK/Ad3iOlTOOmFE1BQfbwx5EyBj8ajRXri52R8JWfB31
 iNQ2SyYCVjJny853OsCArMLz1mXl4JwT35ylrj6p3f49OrE8ejcc1w1AoY/qPwV3Jgo2INygAr2
 o/v8523xScr0aiaxXxNWFy/gLP1qnoJ2rOXIJ/rg3qzWKyDRVC9zTO87fowcX1qVGCiglpp0RvM
 pHRekl83hM6E1pto0zOTpA1Q+9BRt5siAH0hqIY9iR0SboJllTNrTLW/PLHV68E6az9eTSfgM5s
 ZCOi6l85LMVYumHOhdT3IpaPXL9r/yhnxY4TTvT2Y/dEtEI+/jxLj0ih3rPP/PLRxtWmOZb23q7
 gplaK5YJdTKGDWN5rWw==
X-Proofpoint-GUID: et5pQ0h-I0ZCabNa641Q__LRIh2GY8eR
X-Proofpoint-ORIG-GUID: et5pQ0h-I0ZCabNa641Q__LRIh2GY8eR
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a97fad5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zkdjkONUlUTOIc7Tji8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX2Zg2rZnWvBdq
 R/K4Qw+fhzVPspyOKm+BXDRpfh9EVhgkkiiKgM/KDY9TFoCwtYgTyUTL+Tm4mEPPo+Bv6ydipzi
 x/lcOJy5RcxJ6gd8pn3e4Fg+4NDnSDM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020092


On Fri, 28 Aug 2026 15:39:50 +0100, Jon Hunter wrote:
> Add support for the GPIO controllers on the Tegra268 device. At the
> moment there is no device-tree platform/board supported in the mainline
> kernel for Tegra268, but we will be working to add this. For now we are
> starting to upstream some basic driver support to pave the way for
> supporting Tegra268 based platforms.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add compatible string for Tegra268
      https://git.kernel.org/brgl/c/884214495d377b97a27bcfc371fa1f319a63155a
[2/2] gpio: tegra186: Add support for Tegra268
      https://git.kernel.org/brgl/c/d5bc04687649ccf7b15b421052943870d76bbc2e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
