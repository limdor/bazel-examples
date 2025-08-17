pub fn sum(left: i32, right: i32) -> i32 {
    left + right
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn can_sum_two_negative_values() {
        let result = sum(-2, -5);
        assert_eq!(result, -7);
    }
}
